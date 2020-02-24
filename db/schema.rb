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

ActiveRecord::Schema.define(version: 2020_02_24_110719) do

  create_table "rides", force: :cascade do |t|
    t.integer "tride_id"
    t.string "instructor"
    t.date "date"
    t.time "time"
    t.string "format"
    t.integer "duration"
    t.integer "tribe_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["tribe_id"], name: "index_rides_on_tribe_id"
  end

  create_table "tribes", force: :cascade do |t|
    t.string "name"
    t.string "image_url"
    t.string "url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_rides", force: :cascade do |t|
    t.string "milestone"
    t.integer "user_id", null: false
    t.integer "ride_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["ride_id"], name: "index_user_rides_on_ride_id"
    t.index ["user_id"], name: "index_user_rides_on_user_id"
  end

  create_table "user_tribes", force: :cascade do |t|
    t.integer "user_id"
    t.integer "tribe_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.boolean "admin"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "rides", "tribes"
  add_foreign_key "user_rides", "rides"
  add_foreign_key "user_rides", "users"
end
