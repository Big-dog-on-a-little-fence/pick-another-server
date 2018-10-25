# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20181012194117) do

  create_table "activities", force: :cascade do |t|
    t.string   "trackable_type"
    t.integer  "trackable_id"
    t.string   "owner_type"
    t.integer  "owner_id"
    t.string   "key"
    t.text     "parameters"
    t.string   "recipient_type"
    t.integer  "recipient_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["owner_id", "owner_type"], name: "index_activities_on_owner_id_and_owner_type"
    t.index ["recipient_id", "recipient_type"], name: "index_activities_on_recipient_id_and_recipient_type"
    t.index ["trackable_id", "trackable_type"], name: "index_activities_on_trackable_id_and_trackable_type"
  end

  create_table "article_genres", force: :cascade do |t|
    t.integer "article_id"
    t.integer "genre_id"
  end

  create_table "articles", force: :cascade do |t|
    t.string   "title"
    t.string   "key"
    t.string   "instrument"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
    t.string   "youtube_url"
  end

  create_table "charts", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "tune_id"
    t.index ["tune_id"], name: "index_charts_on_tune_id"
  end

  create_table "chords", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.text     "body"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "user_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "genres", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "instrument_tunes", force: :cascade do |t|
    t.integer  "instrument_id", null: false
    t.integer  "tune_id",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["instrument_id"], name: "index_instrument_tunes_on_instrument_id"
    t.index ["tune_id"], name: "index_instrument_tunes_on_tune_id"
  end

  create_table "instruments", force: :cascade do |t|
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "user_id"
    t.integer  "repertoire_id"
    t.string   "type"
    t.index ["repertoire_id"], name: "index_instruments_on_repertoire_id"
    t.index ["user_id"], name: "index_instruments_on_user_id"
  end

  create_table "jam_users", force: :cascade do |t|
    t.integer "jam_id"
    t.integer "user_id"
  end

  create_table "jams", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "jams_tunes", id: false, force: :cascade do |t|
    t.integer "jam_id",  null: false
    t.integer "tune_id", null: false
    t.index ["jam_id"], name: "index_jams_tunes_on_jam_id"
    t.index ["tune_id"], name: "index_jams_tunes_on_tune_id"
  end

  create_table "lyrics", force: :cascade do |t|
    t.string   "version"
    t.text     "body"
    t.integer  "tune_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tune_id"], name: "index_lyrics_on_tune_id"
  end

  create_table "measures", force: :cascade do |t|
    t.string   "body"
    t.integer  "progression_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["progression_id"], name: "index_measures_on_progression_id"
  end

  create_table "notes", force: :cascade do |t|
    t.text     "body"
    t.integer  "tune_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tune_id"], name: "index_notes_on_tune_id"
  end

  create_table "progressions", force: :cascade do |t|
    t.integer  "part_number"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "chord_list"
    t.integer  "chart_id"
    t.index ["chart_id"], name: "index_progressions_on_chart_id"
  end

  create_table "repertoires", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "tune_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sources", force: :cascade do |t|
    t.string   "version"
    t.string   "link"
    t.text     "description"
    t.integer  "tune_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["tune_id"], name: "index_sources_on_tune_id"
  end

  create_table "tune_genres", force: :cascade do |t|
    t.integer "tune_id"
    t.integer "genre_id"
  end

  create_table "tunes", force: :cascade do |t|
    t.string   "name"
    t.string   "key"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "time_signature"
  end

  create_table "user_starred_tunes", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.integer  "tune_id",    null: false
    t.string   "goal"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tune_id"], name: "index_user_starred_tunes_on_tune_id"
    t.index ["user_id"], name: "index_user_starred_tunes_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "username"
    t.boolean  "admin",                  default: false
    t.string   "authentication_token"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

end
