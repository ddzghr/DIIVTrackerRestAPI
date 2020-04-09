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

ActiveRecord::Schema.define(version: 2020_04_08_212452) do

  create_table "account_types", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "code", limit: 10, null: false
    t.string "name", limit: 150, null: false
    t.boolean "internal_admin_type", default: false
    t.boolean "internal_application_type", default: false
    t.boolean "ordering_party_type", default: false
    t.boolean "courier_type", default: false
    t.boolean "supplier_type", default: false
    t.boolean "has_duration", default: false
    t.boolean "has_invoice", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_account_types_on_code", unique: true
  end

  create_table "user_accounts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "account_type_id", null: false
    t.string "invoice", limit: 36
    t.date "valid_from"
    t.date "valid_through"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_type_id"], name: "index_user_accounts_on_account_type_id"
    t.index ["user_id"], name: "index_user_accounts_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "uuid", limit: 36, null: false
    t.string "name", limit: 150, null: false
    t.string "email", limit: 254, null: false
    t.string "password_digest", null: false
    t.string "company_name", limit: 150
    t.boolean "user_active", default: false
    t.boolean "user_locked", default: false
    t.boolean "email_confirmed", default: false
    t.string "confirm_token", null: false
    t.string "password_reset_token", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirm_token"], name: "index_users_on_confirm_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["password_reset_token"], name: "index_users_on_password_reset_token", unique: true
    t.index ["uuid"], name: "index_users_on_uuid", unique: true
  end

  add_foreign_key "user_accounts", "account_types"
  add_foreign_key "user_accounts", "users"
end
