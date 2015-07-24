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

ActiveRecord::Schema.define(version: 20150722091500) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "auto_cars", force: :cascade do |t|
    t.integer  "auto_id"
    t.integer  "car_mark_id"
    t.integer  "car_model_id"
    t.integer  "car_generation_id"
    t.integer  "car_serie_id"
    t.integer  "car_modification_id"
    t.date     "year"
    t.string   "vin",                 limit: 32, default: "", null: false
    t.string   "gos_number",          limit: 16, default: "", null: false
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
  end

  create_table "autos", force: :cascade do |t|
    t.integer  "client_id"
    t.integer  "type_auto"
    t.integer  "create_by",  null: false
    t.integer  "update_by",  null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "banks", force: :cascade do |t|
    t.string   "full_name",    limit: 128, default: ""
    t.string   "name",         limit: 96,  default: ""
    t.string   "city",         limit: 32,  default: ""
    t.string   "bik",          limit: 16,  default: ""
    t.string   "corr_account", limit: 32,  default: ""
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  create_table "car_generations", force: :cascade do |t|
    t.integer  "id_car_generation"
    t.string   "name",              limit: 64
    t.integer  "id_car_model"
    t.string   "year_begin"
    t.string   "year_end"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "car_marks", force: :cascade do |t|
    t.integer  "id_car_mark"
    t.string   "name",        limit: 32
    t.string   "name_rus",    limit: 32
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "car_models", force: :cascade do |t|
    t.integer  "id_car_model"
    t.integer  "id_car_mark"
    t.string   "name",         limit: 64
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "car_modifications", force: :cascade do |t|
    t.integer  "id_car_modification"
    t.integer  "id_car_serie"
    t.integer  "id_car_model"
    t.string   "name",                  limit: 128
    t.integer  "start_production_year"
    t.integer  "end_production_year"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  create_table "car_series", force: :cascade do |t|
    t.integer  "id_car_serie"
    t.integer  "id_car_model"
    t.string   "name",              limit: 128
    t.integer  "id_car_generation"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "cities", force: :cascade do |t|
    t.string   "name",       limit: 32, default: ""
    t.integer  "country_id"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "client_entities", force: :cascade do |t|
    t.integer  "client_id",                                    null: false
    t.string   "cp_position",         limit: 64
    t.string   "cp_last_name",        limit: 32,  default: "", null: false
    t.string   "cp_first_name",       limit: 32,  default: "", null: false
    t.string   "cp_middle_name",      limit: 32,  default: "", null: false
    t.string   "cp_gender"
    t.date     "cp_birthday"
    t.string   "cp_phone",            limit: 32,  default: "", null: false
    t.string   "cp_alt_phone",        limit: 32
    t.string   "cp_fax",              limit: 32
    t.string   "cp_email",            limit: 32
    t.string   "li_company_name",     limit: 128, default: "", null: false
    t.string   "li_inn",              limit: 16
    t.string   "li_kpp",              limit: 16
    t.string   "li_ogrn",             limit: 16
    t.boolean  "li_nds"
    t.text     "li_legal_address"
    t.text     "li_actual_address"
    t.string   "bd_checking_account", limit: 32
    t.string   "bd_bank_bik",         limit: 32
    t.string   "dc_position",         limit: 64
    t.string   "dc_last_name",        limit: 32
    t.string   "dc_first_name",       limit: 32
    t.string   "dc_middle_name",      limit: 32
    t.string   "bc_position",         limit: 64
    t.string   "bc_last_name",        limit: 32
    t.string   "bc_first_name",       limit: 32
    t.string   "bc_middle_name",      limit: 32
    t.string   "bc_phone",            limit: 32
    t.string   "bc_email",            limit: 32
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
  end

  create_table "client_individual_entreps", force: :cascade do |t|
    t.integer  "client_id"
    t.string   "cp_position",         limit: 64
    t.string   "cp_last_name",        limit: 32,  default: "", null: false
    t.string   "cp_first_name",       limit: 32,  default: "", null: false
    t.string   "cp_middle_name",      limit: 32,  default: "", null: false
    t.string   "cp_gender"
    t.date     "cp_birthday"
    t.string   "cp_phone",            limit: 32,  default: "", null: false
    t.string   "cp_alt_phone",        limit: 32
    t.string   "cp_fax",              limit: 32
    t.string   "cp_email",            limit: 32
    t.string   "li_company_name",     limit: 128, default: "", null: false
    t.string   "li_inn",              limit: 16
    t.string   "li_ogrn",             limit: 16
    t.boolean  "li_nds"
    t.text     "li_legal_address"
    t.text     "li_actual_address"
    t.string   "bd_checking_account", limit: 32
    t.string   "bd_bank_bik",         limit: 32
    t.string   "bc_position",         limit: 64
    t.string   "bc_last_name",        limit: 32
    t.string   "bc_first_name",       limit: 32
    t.string   "bc_middle_name",      limit: 32
    t.string   "bc_phone",            limit: 32
    t.string   "bc_email",            limit: 32
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
  end

  create_table "client_individuals", force: :cascade do |t|
    t.integer  "client_id"
    t.string   "last_name",   limit: 32, default: "", null: false
    t.string   "first_name",  limit: 32, default: "", null: false
    t.string   "middle_name", limit: 32, default: "", null: false
    t.string   "gender"
    t.date     "birthday"
    t.string   "phone",       limit: 32, default: "", null: false
    t.string   "alt_phone",   limit: 32
    t.string   "fax",         limit: 32
    t.string   "email",       limit: 32
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  create_table "clients", force: :cascade do |t|
    t.integer  "category",                  default: 0,   null: false
    t.integer  "type_structure",            default: 0,   null: false
    t.string   "name",           limit: 96, default: "",  null: false
    t.integer  "country_id",                default: 1,   null: false
    t.integer  "city_id",                   default: 450, null: false
    t.string   "service"
    t.string   "attraction"
    t.text     "comment"
    t.integer  "create_by",                               null: false
    t.integer  "update_by",                               null: false
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  create_table "countries", force: :cascade do |t|
    t.integer  "id_country"
    t.string   "name",       limit: 32, default: ""
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "deliveries", force: :cascade do |t|
    t.string   "number"
    t.string   "doc_number", limit: 32,                         default: "",  null: false
    t.date     "doc_date"
    t.decimal  "total_pay",             precision: 8, scale: 2, default: 0.0
    t.date     "take_at"
    t.string   "status"
    t.datetime "created_at",                                                  null: false
    t.datetime "updated_at",                                                  null: false
  end

  create_table "delivery_products", force: :cascade do |t|
    t.string   "delivery_id"
    t.string   "article",      limit: 32,                         default: "",  null: false
    t.string   "name",         limit: 64,                         default: "",  null: false
    t.string   "manufacturer", limit: 32,                         default: "",  null: false
    t.integer  "amount"
    t.decimal  "total_price",             precision: 8, scale: 2, default: 0.0
    t.datetime "created_at",                                                    null: false
    t.datetime "updated_at",                                                    null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "client_id"
    t.integer  "auto_id"
    t.string   "number"
    t.string   "status"
    t.integer  "create_by",  null: false
    t.integer  "update_by",  null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.integer  "order_id"
    t.integer  "delivery_id"
    t.string   "article",           limit: 32,                          default: "",  null: false
    t.string   "manufacturer",      limit: 32
    t.string   "name",              limit: 32
    t.string   "description",       limit: 128
    t.string   "condition"
    t.decimal  "purchase_price",                precision: 8, scale: 2, default: 0.0
    t.decimal  "selling_price",                 precision: 8, scale: 2, default: 0.0
    t.integer  "amount",                                                default: 1,   null: false
    t.decimal  "total_purch_price",             precision: 8, scale: 2, default: 0.0
    t.decimal  "total_sell_price",              precision: 8, scale: 2, default: 0.0
    t.string   "status"
    t.decimal  "customer_paid",                 precision: 8, scale: 2, default: 0.0
    t.date     "paid_at"
    t.datetime "created_at",                                                          null: false
    t.datetime "updated_at",                                                          null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                             default: ""
    t.string   "username",                          default: "", null: false
    t.string   "encrypted_password",                default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                     default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.boolean  "admin"
    t.string   "last_name",              limit: 32, default: "", null: false
    t.string   "first_name",             limit: 32, default: "", null: false
    t.string   "middle_name",            limit: 32
    t.string   "position",               limit: 32
    t.string   "gender",                 limit: 16
    t.date     "birthday"
    t.string   "phone",                  limit: 32
    t.string   "w_phone",                limit: 32
  end

  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
