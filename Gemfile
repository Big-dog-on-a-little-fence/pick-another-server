source 'https://rubygems.org'

ruby "2.5.0"

gem 'rails', '>= 6.0.0'
gem 'pg', '~> 0.21'
gem 'puma', '~> 4.3'
# Use devise for authentication
gem 'devise'
gem 'kaminari'
# gem 'bootstrap-will_paginate'
gem 'bootstrap-sass', '~> 3.4.1'
gem 'twitter-bootstrap-rails'
gem 'devise-bootstrap-views'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6.0'
gem 'font-awesome-rails'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '>= 4.1.0'
gem 'active_model_serializers', '~> 0.10.0'
# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# Search and sorting functionality
gem 'ransack'

# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc
# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
# gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
# Acitivity feed to track app recent activity
gem 'public_activity'
gem 'rack-cors', :require => 'rack/cors'
# Nested form helpers, easy to dynamically add/remove nested records
gem "nested_form"
gem 'webpacker'

group :test do
  gem 'database_cleaner'
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'chromedriver-helper'
end

group :development, :test do
  # Use sqlite3 as the database for Active Record
  # gem 'sqlite3'
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  gem 'dotenv'
  gem 'jazz_fingers'
  gem 'bullet'
  gem "better_errors"
  gem "binding_of_caller"
  gem 'rspec-rails', '~> 3.8'
  gem 'factory_bot_rails'
  gem 'faker'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'rails-erd'
  gem 'pry-rails'
end

group :production do
  gem 'rails_12factor'
end