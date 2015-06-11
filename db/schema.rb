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

ActiveRecord::Schema.define(version: 20150610171940) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: true do |t|
    t.string  "name"
    t.integer "user_id"
    t.boolean "towbook", default: false
    t.boolean "audit",   default: false
  end

  add_index "companies", ["user_id"], name: "index_companies_on_user_id", using: :btree

  create_table "devices", force: true do |t|
    t.string  "hardware_id"
    t.integer "company_id"
    t.string  "truck_id"
    t.integer "locations_count", default: 0, null: false
  end

  add_index "devices", ["company_id"], name: "index_devices_on_company_id", using: :btree
  add_index "devices", ["hardware_id"], name: "index_devices_on_hardware_id", using: :btree

  create_table "locations", force: true do |t|
    t.string   "lat"
    t.string   "lng"
    t.datetime "time"
    t.integer  "device_id"
  end

  create_table "sessions", force: true do |t|
    t.string  "token"
    t.integer "sessionable_id",             null: false
    t.string  "sessionable_type", limit: 7, null: false
  end

  add_index "sessions", ["sessionable_id", "sessionable_type"], name: "index_sessions_on_sessionable_id_and_sessionable_type", using: :btree

  create_table "users", force: true do |t|
    t.string "email"
    t.string "password_digest"
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree

end
