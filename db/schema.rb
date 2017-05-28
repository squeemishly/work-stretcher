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

ActiveRecord::Schema.define(version: 20170528222233) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "body_area_stretches", force: :cascade do |t|
    t.bigint "body_area_id"
    t.bigint "stretch_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["body_area_id"], name: "index_body_area_stretches_on_body_area_id"
    t.index ["stretch_id"], name: "index_body_area_stretches_on_stretch_id"
  end

  create_table "body_areas", force: :cascade do |t|
    t.string "name"
  end

  create_table "favorites", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "stretch_id"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["stretch_id"], name: "index_favorites_on_stretch_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "stretches", force: :cascade do |t|
    t.string "name", null: false
    t.string "description", null: false
    t.string "picture", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username", null: false
    t.string "password_digest"
    t.string "email", null: false
    t.integer "role", default: 0
  end

  add_foreign_key "body_area_stretches", "body_areas"
  add_foreign_key "body_area_stretches", "stretches"
  add_foreign_key "favorites", "stretches"
  add_foreign_key "favorites", "users"
end
