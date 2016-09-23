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

ActiveRecord::Schema.define(version: 20160912175760) do

  create_table "account_kinds", force: :cascade do |t|
    t.string   "name",       limit: 55
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "account_resources", force: :cascade do |t|
    t.string   "parameter",       limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "account_kind_id", limit: 4
    t.integer  "resource_id",     limit: 4
  end

  add_index "account_resources", ["account_kind_id"], name: "index_account_resources_on_account_kind_id", using: :btree
  add_index "account_resources", ["resource_id"], name: "index_account_resources_on_resource_id", using: :btree

  create_table "accounts", force: :cascade do |t|
    t.string   "account_status",  limit: 255
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.integer  "user_id",         limit: 4
    t.integer  "account_kind_id", limit: 4,   default: 1
  end

  add_index "accounts", ["account_kind_id"], name: "index_accounts_on_account_kind_id", using: :btree
  add_index "accounts", ["user_id"], name: "index_accounts_on_user_id", using: :btree

  create_table "ad_images", force: :cascade do |t|
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "image_id",   limit: 4
    t.integer  "ad_id",      limit: 4
  end

  add_index "ad_images", ["ad_id"], name: "index_ad_images_on_ad_id", using: :btree
  add_index "ad_images", ["image_id"], name: "index_ad_images_on_image_id", using: :btree

  create_table "addresses", force: :cascade do |t|
    t.string   "complement",     limit: 255
    t.integer  "number",         limit: 4
    t.string   "geolocation",    limit: 255
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "city_id",        limit: 4,   null: false
    t.integer  "state_id",       limit: 4,   null: false
    t.integer  "country_id",     limit: 4,   null: false
    t.integer  "street_id",      limit: 4,   null: false
    t.integer  "postal_code_id", limit: 4,   null: false
  end

  add_index "addresses", ["city_id"], name: "index_addresses_on_city_id", using: :btree
  add_index "addresses", ["country_id"], name: "index_addresses_on_country_id", using: :btree
  add_index "addresses", ["postal_code_id"], name: "index_addresses_on_postal_code_id", using: :btree
  add_index "addresses", ["state_id"], name: "index_addresses_on_state_id", using: :btree
  add_index "addresses", ["street_id"], name: "index_addresses_on_street_id", using: :btree

  create_table "ads", force: :cascade do |t|
    t.text     "description",   limit: 65535
    t.decimal  "rating_avg",                  precision: 3, scale: 2
    t.datetime "created_at",                                          null: false
    t.datetime "updated_at",                                          null: false
    t.integer  "profession_id", limit: 4
    t.integer  "user_id",       limit: 4
  end

  add_index "ads", ["profession_id"], name: "index_ads_on_profession_id", using: :btree
  add_index "ads", ["user_id"], name: "index_ads_on_user_id", using: :btree

  create_table "cities", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "countries", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "images", force: :cascade do |t|
    t.string   "url",        limit: 255
    t.string   "path",       limit: 255
    t.string   "title",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "operators", force: :cascade do |t|
    t.string   "name",       limit: 25
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "phones", force: :cascade do |t|
    t.string   "number",      limit: 11
    t.boolean  "haswp",                  default: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.integer  "operator_id", limit: 4,  default: 1
  end

  add_index "phones", ["operator_id"], name: "index_phones_on_operator_id", using: :btree

  create_table "postal_codes", force: :cascade do |t|
    t.integer  "zip_number", limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "professions", force: :cascade do |t|
    t.string   "name_m",     limit: 75
    t.string   "name_f",     limit: 75
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "rates", force: :cascade do |t|
    t.decimal  "punctuality",              precision: 3, scale: 2
    t.decimal  "quality",                  precision: 3, scale: 2
    t.decimal  "presentation",             precision: 3, scale: 2
    t.string   "comments",     limit: 255
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
    t.integer  "ad_id",        limit: 4
    t.integer  "user_id",      limit: 4
  end

  add_index "rates", ["ad_id"], name: "index_rates_on_ad_id", using: :btree
  add_index "rates", ["user_id"], name: "index_rates_on_user_id", using: :btree

  create_table "resources", force: :cascade do |t|
    t.string   "name",          limit: 255
    t.string   "parameterType", limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "states", force: :cascade do |t|
    t.string   "name",       limit: 2
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "streets", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "user_phones", force: :cascade do |t|
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "phone_id",   limit: 4
    t.integer  "user_id",    limit: 4
  end

  add_index "user_phones", ["phone_id"], name: "index_user_phones_on_phone_id", using: :btree
  add_index "user_phones", ["user_id"], name: "index_user_phones_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name",                limit: 175
    t.string   "doc",                 limit: 75
    t.date     "birthdate"
    t.string   "email",               limit: 175
    t.date     "last_logon"
    t.date     "certdate"
    t.string   "pwd",                 limit: 175
    t.binary   "slt",                 limit: 65535
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.integer  "address_id",          limit: 4
    t.integer  "image_id",            limit: 4
    t.string   "avatar_file_name",    limit: 255
    t.string   "avatar_content_type", limit: 255
    t.integer  "avatar_file_size",    limit: 4
    t.datetime "avatar_updated_at"
  end

  add_index "users", ["address_id"], name: "index_users_on_address_id", using: :btree
  add_index "users", ["image_id"], name: "index_users_on_image_id", using: :btree

  add_foreign_key "account_resources", "account_kinds"
  add_foreign_key "account_resources", "resources"
  add_foreign_key "accounts", "account_kinds"
  add_foreign_key "accounts", "users"
  add_foreign_key "ad_images", "ads"
  add_foreign_key "ad_images", "images"
  add_foreign_key "addresses", "cities"
  add_foreign_key "addresses", "countries"
  add_foreign_key "addresses", "postal_codes"
  add_foreign_key "addresses", "states"
  add_foreign_key "addresses", "streets"
  add_foreign_key "ads", "professions"
  add_foreign_key "ads", "users"
  add_foreign_key "phones", "operators"
  add_foreign_key "rates", "ads"
  add_foreign_key "rates", "users"
  add_foreign_key "user_phones", "phones"
  add_foreign_key "user_phones", "users"
  add_foreign_key "users", "addresses"
  add_foreign_key "users", "images"
end
