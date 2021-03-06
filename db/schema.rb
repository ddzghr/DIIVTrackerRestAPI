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

ActiveRecord::Schema.define(version: 2020_04_12_112849) do

  create_table "address_types", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "code", limit: 10, null: false
    t.string "name", limit: 50, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_address_types_on_code", unique: true
  end

  create_table "addresses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "street", limit: 150, null: false
    t.string "city_arrea_or_district", limit: 150
    t.string "city_or_town_or_village", limit: 150, null: false
    t.string "county", limit: 150
    t.string "postal_code_and_name", limit: 150, null: false
    t.string "country", limit: 150
    t.string "addressable_type"
    t.bigint "addressable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["addressable_type", "addressable_id"], name: "index_addresses_on_addressable_type_and_addressable_id"
  end

  create_table "contacts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "name", limit: 150
    t.string "phone", limit: 50
    t.string "contactable_type"
    t.bigint "contactable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contactable_type", "contactable_id"], name: "index_contacts_on_contactable_type_and_contactable_id"
  end

  create_table "deliveries", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "uuid", limit: 36, null: false
    t.string "orderer_email", limit: 254, null: false
    t.string "orderer_name", limit: 150, null: false
    t.decimal "amount_on_delivery", precision: 15, scale: 2
    t.bigint "orderer_id"
    t.bigint "supplier_id", null: false
    t.bigint "courier_id", null: false
    t.text "annotation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["courier_id"], name: "index_deliveries_on_courier_id"
    t.index ["orderer_id"], name: "index_deliveries_on_orderer_id"
    t.index ["supplier_id"], name: "index_deliveries_on_supplier_id"
    t.index ["uuid"], name: "index_deliveries_on_uuid", unique: true
  end

  create_table "delivery_addresses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "delivery_id", null: false
    t.bigint "address_types_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_types_id"], name: "index_delivery_addresses_on_address_types_id"
    t.index ["delivery_id"], name: "index_delivery_addresses_on_delivery_id"
  end

  create_table "delivery_statuses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "delivery_id", null: false
    t.bigint "status_id", null: false
    t.bigint "device_id", null: false
    t.datetime "local_datetime", null: false
    t.bigint "assigned_device_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["assigned_device_id"], name: "index_delivery_statuses_on_assigned_device_id"
    t.index ["delivery_id"], name: "index_delivery_statuses_on_delivery_id"
    t.index ["device_id"], name: "index_delivery_statuses_on_device_id"
    t.index ["status_id"], name: "index_delivery_statuses_on_status_id"
  end

  create_table "device_types", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "code", limit: 10, null: false
    t.string "name", limit: 150, null: false
    t.boolean "internal_api_server_type", default: false, null: false
    t.boolean "internal_web_server_type", default: false, null: false
    t.boolean "desktop_type", default: false, null: false
    t.boolean "web_server_type", default: false, null: false
    t.boolean "mobile_type", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_device_types_on_code", unique: true
    t.index ["internal_api_server_type", "internal_web_server_type", "desktop_type", "web_server_type", "mobile_type"], name: "device_types_type_uk", unique: true
  end

  create_table "devices", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "uuid", limit: 36, null: false
    t.string "secret_token_digest", null: false
    t.string "name", limit: 150, null: false
    t.bigint "user_id", null: false
    t.bigint "device_type_id", null: false
    t.date "valid_from"
    t.date "valid_through"
    t.boolean "device_active", null: false
    t.boolean "device_confirmed", null: false
    t.string "confirm_token", null: false
    t.boolean "device_locked", null: false
    t.string "unlock_token", null: false
    t.string "connection_token", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirm_token"], name: "index_devices_on_confirm_token", unique: true
    t.index ["device_type_id"], name: "index_devices_on_device_type_id"
    t.index ["user_id"], name: "index_devices_on_user_id"
    t.index ["uuid"], name: "index_devices_on_uuid", unique: true
  end

  create_table "gps_locations", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.float "gps_latitude", null: false
    t.float "gps_longitude", null: false
    t.string "locatable_type", null: false
    t.bigint "locatable_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["locatable_type", "locatable_id"], name: "index_gps_locations_on_locatable_type_and_locatable_id"
  end

  create_table "role_device_types", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "role_id", null: false
    t.bigint "device_type_id", null: false
    t.boolean "applicable", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["device_type_id"], name: "index_role_device_types_on_device_type_id"
    t.index ["role_id", "device_type_id"], name: "role_device_types_uk", unique: true
    t.index ["role_id"], name: "index_role_device_types_on_role_id"
  end

  create_table "roles", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "code", limit: 10, null: false
    t.string "name", limit: 150, null: false
    t.boolean "internal_admin_type", default: false, null: false
    t.boolean "internal_application_type", default: false, null: false
    t.boolean "ordering_party_type", default: false, null: false
    t.boolean "courier_type", default: false, null: false
    t.boolean "supplier_type", default: false, null: false
    t.boolean "has_duration", default: false, null: false
    t.boolean "has_invoice", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_roles_on_code", unique: true
    t.index ["internal_admin_type", "internal_application_type", "ordering_party_type", "courier_type", "supplier_type"], name: "roles_type_uk", unique: true
  end

  create_table "statuses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "code", limit: 10, null: false
    t.string "name", limit: 75, null: false
    t.boolean "new_type_status", default: false, null: false
    t.boolean "in_progress_type_status", default: false, null: false
    t.boolean "stored_type_status", default: false, null: false
    t.boolean "delivered_type_status", default: false, null: false
    t.bigint "status_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_statuses_on_code", unique: true
    t.index ["status_id"], name: "index_statuses_on_status_id"
  end

  create_table "user_roles", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "uuid", limit: 36, null: false
    t.bigint "user_id", null: false
    t.bigint "role_id", null: false
    t.string "invoice", limit: 36
    t.date "valid_from"
    t.date "valid_through"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role_id"], name: "index_user_roles_on_role_id"
    t.index ["user_id"], name: "index_user_roles_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "uuid", limit: 36, null: false
    t.string "name", limit: 150, null: false
    t.string "email", limit: 254, null: false
    t.string "password_digest", null: false
    t.string "company_name", limit: 150
    t.boolean "user_active", null: false
    t.boolean "user_locked", null: false
    t.boolean "email_confirmed", null: false
    t.boolean "force_password_change", null: false
    t.string "confirm_token", null: false
    t.string "password_reset_token", null: false
    t.string "connection_token", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirm_token"], name: "index_users_on_confirm_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["password_reset_token"], name: "index_users_on_password_reset_token", unique: true
    t.index ["uuid"], name: "index_users_on_uuid", unique: true
  end

  create_table "workflows", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "old_status_id", null: false
    t.bigint "new_status_id", null: false
    t.bigint "device_type_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["device_type_id"], name: "index_workflows_on_device_type_id"
    t.index ["new_status_id"], name: "index_workflows_on_new_status_id"
    t.index ["old_status_id", "new_status_id", "device_type_id"], name: "workflow_uk", unique: true
    t.index ["old_status_id"], name: "index_workflows_on_old_status_id"
  end

  add_foreign_key "deliveries", "users", column: "courier_id"
  add_foreign_key "deliveries", "users", column: "orderer_id"
  add_foreign_key "deliveries", "users", column: "supplier_id"
  add_foreign_key "delivery_addresses", "address_types", column: "address_types_id"
  add_foreign_key "delivery_addresses", "deliveries"
  add_foreign_key "delivery_statuses", "deliveries"
  add_foreign_key "delivery_statuses", "devices"
  add_foreign_key "delivery_statuses", "devices", column: "assigned_device_id"
  add_foreign_key "delivery_statuses", "statuses"
  add_foreign_key "devices", "device_types"
  add_foreign_key "devices", "users"
  add_foreign_key "role_device_types", "device_types"
  add_foreign_key "role_device_types", "roles"
  add_foreign_key "statuses", "statuses"
  add_foreign_key "user_roles", "roles"
  add_foreign_key "user_roles", "users"
  add_foreign_key "workflows", "device_types"
  add_foreign_key "workflows", "statuses", column: "new_status_id"
  add_foreign_key "workflows", "statuses", column: "old_status_id"
end
