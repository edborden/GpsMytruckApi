ActiveRecord::Schema.define(version: 0) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "users", force: true do |t|
    t.string   "email"
    t.string "password_digest"
  end
  add_index "users", ["email"]

  create_table "sessions", force: true do |t|
    t.string  "token"
    t.integer "user_id"
  end
  add_index "sessions", ["token","user_id"]

  create_table "companies", force: true do |t|
    t.string   "name"
    t.integer "user_id"
    t.boolean "towbook", default: false
    t.boolean "audit", default: false
  end
  add_index "companies", ["user_id"]

  create_table "devices", force: true do |t|
    t.string   "hardware_id"
    t.integer "company_id"
    t.string "truck_id"
  end
  add_index "devices", ["company_id","hardware_id"]

  create_table "locations", force: true do |t|
    t.string   "lat"
    t.string "lng"
    t.string "time"
    t.integer "device_id"
  end
  add_index "devices", ["company_id"]

end
