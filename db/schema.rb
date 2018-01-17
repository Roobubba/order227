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

ActiveRecord::Schema.define(version: 20180117225152) do

  create_table "band_shows", force: :cascade do |t|
    t.integer "band_id"
    t.integer "show_id"
  end

  create_table "bands", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "contact_name"
    t.string "url"
  end

  create_table "pictures", force: :cascade do |t|
    t.string "picture"
    t.string "alt_text"
    t.boolean "in_gallery", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "show_id"
  end

  create_table "posts", force: :cascade do |t|
    t.text "post_text"
    t.string "title"
    t.integer "picture_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "picture_url"
  end

  create_table "release_types", force: :cascade do |t|
    t.string "type"
  end

  create_table "releases", force: :cascade do |t|
    t.string "title"
    t.string "url"
    t.text "comments"
    t.date "release_date"
    t.integer "releasetype_id"
    t.integer "picture_id"
  end

  create_table "shows", force: :cascade do |t|
    t.date "date"
    t.integer "venue_id"
    t.integer "picture_id"
    t.string "url"
  end

  create_table "tracks", force: :cascade do |t|
    t.string "title"
    t.string "url"
    t.string "comments"
    t.text "lyrics"
    t.date "recorded_date"
    t.integer "release_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
    t.string "password_digest"
  end

  create_table "venue_shows", force: :cascade do |t|
    t.integer "venue_id"
    t.integer "show_id"
  end

  create_table "venues", force: :cascade do |t|
    t.string "name"
    t.string "city"
    t.string "country"
    t.string "contact_name"
    t.string "contact_detail"
  end

  create_table "videos", force: :cascade do |t|
    t.string "title"
    t.string "credit"
    t.string "url"
    t.date "date"
    t.integer "venue_id"
  end

end
