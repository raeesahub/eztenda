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

ActiveRecord::Schema.define(version: 2021_03_21_123457) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bids", force: :cascade do |t|
    t.string "description"
    t.integer "amount"
    t.string "confirmed", default: "pending"
    t.string "incentives"
    t.string "RTM"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "tender_id"
    t.bigint "product_id"
    t.bigint "user_id"
    t.bigint "contract_id"
    t.index ["contract_id"], name: "index_bids_on_contract_id"
    t.index ["product_id"], name: "index_bids_on_product_id"
    t.index ["tender_id"], name: "index_bids_on_tender_id"
    t.index ["user_id"], name: "index_bids_on_user_id"
  end

  create_table "businesses", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "location"
    t.string "number_of_venues"
    t.string "image_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_businesses_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "contracts", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "category_id"
    t.bigint "user_id"
    t.string "title"
    t.string "description"
    t.index ["category_id"], name: "index_products_on_category_id"
    t.index ["user_id"], name: "index_products_on_user_id"
  end

  create_table "tenders", force: :cascade do |t|
    t.string "description"
    t.integer "min_bid"
    t.date "start_date"
    t.date "end_date"
    t.integer "volume"
    t.boolean "active"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "business_id"
    t.bigint "categories_id"
    t.bigint "contract_id"
    t.index ["business_id"], name: "index_tenders_on_business_id"
    t.index ["categories_id"], name: "index_tenders_on_categories_id"
    t.index ["contract_id"], name: "index_tenders_on_contract_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "user_type"
    t.string "legal_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bids", "contracts"
  add_foreign_key "bids", "products"
  add_foreign_key "bids", "tenders"
  add_foreign_key "bids", "users"
  add_foreign_key "businesses", "users"
  add_foreign_key "products", "categories"
  add_foreign_key "products", "users"
  add_foreign_key "tenders", "businesses"
  add_foreign_key "tenders", "categories", column: "categories_id"
  add_foreign_key "tenders", "contracts"
end
