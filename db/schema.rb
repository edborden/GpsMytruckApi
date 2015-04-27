ActiveRecord::Schema.define(version: 0) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "users", force: true do |t|
    t.string   "email"
    t.string "password_digest"
  end
  add_index "users", ["email"], using: :btree

  create_table "sessions", force: true do |t|
    t.string  "token"
    t.integer "user_id"
  end
  add_index "sessions", ["token","user_id"], using: :btree

  create_table "companies", force: true do |t|
    t.string   "name"
    t.integer "user_id"
    t.boolean "towbook", default: false
    t.boolean "audit", default: false
  end
  add_index "companies", ["user_id"], using: :btree

  create_table "devices", force: true do |t|
    t.string   "hardware_id"
    t.integer "company_id"
  end
  add_index "devices", ["company_id"], using: :btree

end
