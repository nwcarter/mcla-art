# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150416175325) do

  create_table "artists", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "artists_arts", force: :cascade do |t|
    t.integer "art_id"
    t.integer "artist_id"
  end

  add_index "artists_arts", ["art_id"], name: "index_artists_arts_on_art_id"
  add_index "artists_arts", ["artist_id"], name: "index_artists_arts_on_artist_id"

  create_table "artists_events", id: false, force: :cascade do |t|
    t.integer "event_id"
    t.integer "artist_id"
  end

  add_index "artists_events", ["artist_id"], name: "index_artists_events_on_artist_id"
  add_index "artists_events", ["event_id"], name: "index_artists_events_on_event_id"

  create_table "arts", force: :cascade do |t|
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "name"
  end

  create_table "arts_events", id: false, force: :cascade do |t|
    t.integer "event_id"
    t.integer "art_id"
  end

  add_index "arts_events", ["art_id"], name: "index_arts_events_on_art_id"
  add_index "arts_events", ["event_id"], name: "index_arts_events_on_event_id"

  create_table "events", force: :cascade do |t|
    t.string   "title"
    t.string   "location"
    t.string   "about"
    t.string   "history"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "poster_file_name"
    t.string   "poster_content_type"
    t.integer  "poster_file_size"
    t.datetime "poster_updated_at"
    t.string   "time"
    t.string   "end_time"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
    t.string   "remember_digest"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
