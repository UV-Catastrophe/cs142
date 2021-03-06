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

ActiveRecord::Schema.define(version: 20150305234136) do

  create_table "comments", force: :cascade do |t|
    t.integer  "photo_id"
    t.integer  "user_id"
    t.datetime "date_time"
    t.text     "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "comments", ["photo_id"], name: "index_comments_on_photo_id"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "photos", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "date_time"
    t.string   "file_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "photos", ["user_id"], name: "index_photos_on_user_id"

  create_table "sessions", force: :cascade do |t|
    t.string   "session_id", null: false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], name: "index_sessions_on_session_id", unique: true
  add_index "sessions", ["updated_at"], name: "index_sessions_on_updated_at"

  create_table "tags", force: :cascade do |t|
    t.integer  "photo_id"
    t.integer  "user_id"
    t.integer  "left_px"
    t.integer  "top_px"
    t.integer  "width_px"
    t.integer  "height_px"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "tags", ["photo_id"], name: "index_tags_on_photo_id"
  add_index "tags", ["user_id"], name: "index_tags_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "login"
    t.string   "password_digest"
    t.string   "salt"
  end

end
