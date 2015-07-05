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

ActiveRecord::Schema.define(version: 20150629181706) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "auto_cars", force: :cascade do |t|
    t.integer  "auto_id"
    t.string   "mark"
    t.string   "model"
    t.string   "generation"
    t.string   "serie"
    t.string   "modification"
    t.date     "year"
    t.string   "vin"
    t.string   "gos_number"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "autos", force: :cascade do |t|
    t.integer  "client_id"
    t.integer  "type"
    t.integer  "create_by",  null: false
    t.integer  "update_by",  null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "banks", force: :cascade do |t|
    t.string   "full_name"
    t.string   "name"
    t.string   "city"
    t.string   "bik"
    t.string   "corr_account"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "car_generations", force: :cascade do |t|
    t.integer  "id_car_generation"
    t.string   "name"
    t.integer  "id_car_model"
    t.string   "year_begin"
    t.string   "year_end"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "car_marks", force: :cascade do |t|
    t.integer  "id_car_mark"
    t.string   "name"
    t.string   "name_rus"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "car_models", force: :cascade do |t|
    t.integer  "id_car_model"
    t.integer  "id_car_mark"
    t.string   "name"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "car_modifications", force: :cascade do |t|
    t.integer  "id_car_modification"
    t.integer  "id_car_serie"
    t.integer  "id_car_model"
    t.string   "name"
    t.integer  "start_production_year"
    t.integer  "end_production_year"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "car_series", force: :cascade do |t|
    t.integer  "id_car_serie"
    t.integer  "id_car_model"
    t.string   "name"
    t.integer  "id_car_generation"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "cities", force: :cascade do |t|
    t.string   "name"
    t.integer  "country_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "client_entities", force: :cascade do |t|
    t.integer  "client_id"
    t.string   "cp_position"
    t.string   "cp_last_name"
    t.string   "cp_first_name"
    t.string   "cp_middle_name"
    t.string   "cp_gender"
    t.date     "cp_birthday"
    t.string   "cp_phone"
    t.string   "cp_alt_phone"
    t.string   "cp_fax"
    t.string   "cp_email"
    t.string   "li_company_name"
    t.string   "li_inn"
    t.string   "li_kpp"
    t.string   "li_ogrn"
    t.boolean  "li_nds"
    t.text     "li_legal_address"
    t.text     "li_actual_address"
    t.string   "bd_checking_account"
    t.string   "bd_bank_bik"
    t.string   "dc_position"
    t.string   "dc_last_name"
    t.string   "dc_first_name"
    t.string   "dc_middle_name"
    t.string   "bc_position"
    t.string   "bc_last_name"
    t.string   "bc_first_name"
    t.string   "bc_middle_name"
    t.string   "bc_phone"
    t.string   "bc_email"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "client_individual_entreps", force: :cascade do |t|
    t.integer  "client_id"
    t.string   "cp_position"
    t.string   "cp_last_name"
    t.string   "cp_first_name"
    t.string   "cp_middle_name"
    t.string   "cp_gender"
    t.date     "cp_birthday"
    t.string   "cp_phone"
    t.string   "cp_alt_phone"
    t.string   "cp_fax"
    t.string   "cp_email"
    t.string   "li_company_name"
    t.string   "li_inn"
    t.string   "li_ogrn"
    t.boolean  "li_nds"
    t.text     "li_legal_address"
    t.text     "li_actual_address"
    t.string   "bd_checking_account"
    t.string   "bd_bank_bik"
    t.string   "dc_last_name"
    t.string   "dc_first_name"
    t.string   "dc_middle_name"
    t.string   "bc_position"
    t.string   "bc_last_name"
    t.string   "bc_first_name"
    t.string   "bc_middle_name"
    t.string   "bc_phone"
    t.string   "bc_email"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "client_individuals", force: :cascade do |t|
    t.integer  "client_id"
    t.string   "last_name"
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "gender"
    t.date     "birthday"
    t.string   "phone"
    t.string   "alt_phone"
    t.string   "fax"
    t.string   "email"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "clients", force: :cascade do |t|
    t.integer  "category"
    t.integer  "type_structure"
    t.string   "name"
    t.integer  "country_id"
    t.integer  "city_id"
    t.string   "service"
    t.string   "attraction"
    t.text     "comment"
    t.integer  "create_by",      null: false
    t.integer  "update_by",      null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "countries", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "client_id"
    t.string   "number"
    t.integer  "create_by",  null: false
    t.integer  "update_by",  null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.integer  "order_id"
    t.string   "article"
    t.string   "manufacturer"
    t.string   "name"
    t.string   "description"
    t.string   "condition"
    t.decimal  "purchase_price"
    t.decimal  "selling_price"
    t.integer  "amount"
    t.decimal  "total_purch_price"
    t.decimal  "total_sell_price"
    t.string   "location"
    t.decimal  "customer_paid"
    t.integer  "create_by",         null: false
    t.integer  "update_by",         null: false
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: ""
    t.string   "username",               default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
