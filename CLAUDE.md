# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this is

"Pick Another" — a Rails app for musicians to track which tunes (traditional/folk tunes) they know on which instruments, organize jam sessions, and view chord charts. Server-rendered with `erb` views (Bootstrap 3 + jQuery via Sprockets/coffeescript), plus a minimal JSON API and Webpacker/React scaffold that is barely used (`app/javascript/packs/hello_react.jsx` is a stub — most UI is server-rendered).

## Commands

Database is Postgres; native (non-Docker) setup expects a local Postgres with a `postgres`/`password` superuser (see `config/database.yml`).

```bash
bin/setup                    # bundle install, db:prepare, clear logs/tmp, restart
bin/rails server              # run the app
bin/rails db:migrate
bin/rails console
```

### Docker (alternative workflow, see README.md)

```bash
docker-compose up --build
docker-compose run --rm web bin/rails g migration AddStuffToThings
```

### Tests — two suites coexist

This repo has both Minitest (`test/`, Rails' default generated suite) and RSpec (`spec/`, added later with FactoryBot/Faker/Capybara/Selenium). New tests should go in `spec/` (RSpec) — that's where the more recent/active coverage lives (controller specs, request specs, view specs, feature specs). CI (`.travis.yml`) only runs the Minitest suite via `bin/rake test`, so don't assume `spec/` is exercised in CI.

```bash
bundle exec rspec                        # whole RSpec suite
bundle exec rspec spec/models/tune_spec.rb
bundle exec rspec spec/models/tune_spec.rb:12   # single example at line 12

bin/rails test                           # whole Minitest suite
bin/rails test test/models/tune_test.rb
```

RSpec feature specs use Capybara + Selenium (`webdriver`), so they need a browser driver available. Model/controller specs use FactoryBot factories in `spec/factories/`.

### Frontend assets

JS/CSS mostly ships through Sprockets (`app/assets/javascripts`, `app/assets/stylesheets`) using CoffeeScript + SCSS + Bootstrap. Webpacker (`bin/webpack`, `bin/webpack-dev-server`) only compiles the small React stub pack — don't assume feature work happens there unless you're extending that pack specifically.

## Architecture

### Domain model

- **User** — Devise-authenticated (`database_authenticatable, registerable, recoverable, rememberable, trackable, validatable`), with a custom `username`-or-email login (`find_for_database_authentication`) and a per-user `authentication_token` for API/token auth (`ensure_authentication_token`, generated `before_save`).
- **Instrument** — single-table inheritance keyed on `type` (`Instrument.types`: Accordion, Banjo, Bass, Cello, Clarinet, Guitar, Mandolin, Piano, Saxophone, Trombone, Violin, Voice — each a trivial subclass file in `app/models/`). A `User has_one` of each instrument type and `has_many :instruments` overall. `routes.rb` mounts one set of nested `resources` per instrument type (e.g. `resources :guitars, controller: 'instruments', type: 'Guitar'`), all routed through the single `InstrumentsController`, which reads `params[:type]` to know which STI subclass it's operating on.
- **Tune** — a song/tune. Linked to instruments via the **InstrumentTune** join model (which instruments/users know which tunes), to **Genre** via `TuneGenre`, and has one **Lyric** (uses Action Text — `has_rich_text` migrated in `20211101181042_migrate_lyric_body_to_action_text.rb`), many **Source**s, many **Chart**s, and many **Tuning**s via `TuneTuning`.
- **Chart → Progression → Measure/Chord** — a chord chart is a nested structure: `Chart has_many :progressions` (ordered by `part_number`, e.g. "A part"/"B part"), each `Progression has_many :measures` and `has_many :chords`. Charts use `accepts_nested_attributes_for` at both levels, so chart create/update forms post a nested `progressions_attributes` → `measures_attributes` tree in one request.
- **Jam** — a jam session linking multiple `User`s (via `JamUser`) with `tunes` derived as the intersection of participants' known tunes (`Jam#tunes_everyone_knows`, `Api::JamsController#tunes_in_common_between`). Jams are created through the JSON:API endpoints (see below), not HTML forms.
- **Comment** — polymorphic (`commentable_type`/`commentable_id`), and self-referential (comments can have child comments), attached to Tunes, Articles, and Jams.
- **Article** — user-authored write-ups (news/blog-style), separate from Tunes, with its own Genre join (`ArticleGenre`) and Comments.
- **PublicActivity** (`public_activity` gem) is mixed into `Tune`, `Comment`, and `InstrumentTune` to auto-log activity feed entries (rendered by `ActivitiesController` / `app/views/public_activity/**`).

### Two parallel APIs

1. **HTML app** — standard Rails controllers/views under `ApplicationController`, session-based Devise auth, CSRF protection (`protect_from_forgery with: :exception`, downgraded to `:null_session` for JSON requests).
2. **JSON:API** — under `app/controllers/api/` (namespace `api`), controllers inherit from `ApiController < ActionController::API` (no CSRF/session/view machinery). Serialization uses `active_model_serializers` configured globally to the **JSON:API adapter** (`config/initializers/json_api.rb`). Auth for this API is token-based: `ApplicationController#authenticate_user_from_token!` (HTTP Token auth, token + `email` param) runs before the normal session-based `authenticate_user!` — the frontend/mobile client sends `Authorization: Token token="...", email="..."`, and `SessionsController#create` returns that token as JSON on login. Currently only `Api::JamsController` and `Api::UsersController` exist. CORS for this API is configured in `config/application.rb` (`Rack::Cors`), allowing `localhost:4200` in development and `pickanother.one`/`www.pickanother.one` in production — i.e. a separate JS client app is expected to consume this API from a different origin.

### Routing conventions to know

- Per-instrument-type nested routes (`resources :guitars, controller: 'instruments', type: 'Guitar', except: [:index, :show]` under `users`, plus top-level `only: [:index, :show]` versions) all funnel into `InstrumentsController` — when tracing instrument behavior, always check `params[:type]` handling there rather than looking for a `GuitarsController`.
- `tune_tunings` and `instrument_tunes` both expose bulk `new_multiple`/`create_multiple`/`edit_multiple`/`update_multiple` collection routes, used for assigning many tunings/instruments to a tune at once (see `app/views/instrument_tunes/*_multiple.html.erb`).
- `resources :tunes, except: [:destroy]` — tunes are intentionally never hard-deleted through the standard route.

### Auth details

- `require_admin` (in `UsersController`) gates user destruction on `current_user.admin?` — there's no dedicated admin namespace, just per-action checks.
- `User#username` is validated against `/^[a-zA-Z0-9_\.]*$/` and must be unique case-insensitively; login can be by username or email (see `find_for_database_authentication`).
