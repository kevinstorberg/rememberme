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

ActiveRecord::Schema.define(version: 20160809175958) do

  create_table "admins", force: :cascade do |t|
    t.string   "name"
    t.string   "password"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "memorials", force: :cascade do |t|
    t.string  "first_name"
    t.string  "last_name"
    t.date    "dob"
    t.date    "dod"
    t.integer "user_id"
    t.string  "slug"
    t.string  "place_of_birth"
    t.string  "place_of_death"
    t.text    "bio"
  end

  create_table "pictures", force: :cascade do |t|
    t.string   "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text     "body"
  end

  create_table "posts", force: :cascade do |t|
    t.integer  "postable_id"
    t.string   "postable_type"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "memorial_id"
    t.integer  "user_id"
  end

  add_index "posts", ["postable_id"], name: "index_posts_on_postable_id"

  create_table "texts", force: :cascade do |t|
    t.text     "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "videos", force: :cascade do |t|
    t.string   "video_file"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text     "body"
  end

end
