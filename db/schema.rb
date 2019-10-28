# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_10_28_145206) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "activities", id: :serial, force: :cascade do |t|
    t.string "trackable_type"
    t.integer "trackable_id"
    t.string "owner_type"
    t.integer "owner_id"
    t.string "key"
    t.text "parameters"
    t.string "recipient_type"
    t.integer "recipient_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["owner_id", "owner_type"], name: "index_activities_on_owner_id_and_owner_type"
    t.index ["recipient_id", "recipient_type"], name: "index_activities_on_recipient_id_and_recipient_type"
    t.index ["trackable_id", "trackable_type"], name: "index_activities_on_trackable_id_and_trackable_type"
  end

  create_table "article_genres", id: :serial, force: :cascade do |t|
    t.integer "article_id"
    t.integer "genre_id"
  end

  create_table "articles", id: :serial, force: :cascade do |t|
    t.string "title"
    t.string "key"
    t.string "instrument"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.string "youtube_url"
  end

  create_table "charts", id: :serial, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "tune_id"
    t.index ["tune_id"], name: "index_charts_on_tune_id"
  end

  create_table "chords", id: :serial, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", id: :serial, force: :cascade do |t|
    t.text "body"
    t.integer "commentable_id"
    t.string "commentable_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "genres", id: :serial, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "instrument_tunes", id: :serial, force: :cascade do |t|
    t.integer "instrument_id", null: false
    t.integer "tune_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["instrument_id"], name: "index_instrument_tunes_on_instrument_id"
    t.index ["tune_id"], name: "index_instrument_tunes_on_tune_id"
  end

  create_table "instruments", id: :serial, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.string "type"
    t.index ["user_id"], name: "index_instruments_on_user_id"
  end

  create_table "jam_users", id: :serial, force: :cascade do |t|
    t.integer "jam_id"
    t.integer "user_id"
  end

  create_table "jams", id: :serial, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lyrics", id: :serial, force: :cascade do |t|
    t.string "version"
    t.text "body"
    t.integer "tune_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tune_id"], name: "index_lyrics_on_tune_id"
  end

  create_table "measures", id: :serial, force: :cascade do |t|
    t.string "body"
    t.integer "progression_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["progression_id"], name: "index_measures_on_progression_id"
  end

  create_table "notes", id: :serial, force: :cascade do |t|
    t.text "body"
    t.integer "tune_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tune_id"], name: "index_notes_on_tune_id"
  end

  create_table "progressions", id: :serial, force: :cascade do |t|
    t.integer "part_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "chord_list"
    t.integer "chart_id"
    t.index ["chart_id"], name: "index_progressions_on_chart_id"
  end

  create_table "sources", id: :serial, force: :cascade do |t|
    t.string "version"
    t.string "link"
    t.text "description"
    t.integer "tune_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tune_id"], name: "index_sources_on_tune_id"
  end

  create_table "tune_genres", id: :serial, force: :cascade do |t|
    t.integer "tune_id"
    t.integer "genre_id"
  end

  create_table "tune_tunings", id: :serial, force: :cascade do |t|
    t.integer "tune_id"
    t.integer "tuning_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tune_id"], name: "index_tune_tunings_on_tune_id"
    t.index ["tuning_id"], name: "index_tune_tunings_on_tuning_id"
  end

  create_table "tunes", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "key"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "time_signature"
  end

  create_table "tunings", id: :serial, force: :cascade do |t|
    t.string "notes"
    t.string "name"
    t.string "instrument_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_starred_tunes", id: :serial, force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "tune_id", null: false
    t.string "goal"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tune_id"], name: "index_user_starred_tunes_on_tune_id"
    t.index ["user_id"], name: "index_user_starred_tunes_on_user_id"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.boolean "admin", default: false
    t.string "authentication_token"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "charts", "tunes"
  add_foreign_key "comments", "users"
  add_foreign_key "instruments", "users"
  add_foreign_key "lyrics", "tunes"
  add_foreign_key "measures", "progressions"
  add_foreign_key "notes", "tunes"
  add_foreign_key "progressions", "charts"
  add_foreign_key "sources", "tunes"
end
