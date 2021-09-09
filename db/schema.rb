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

ActiveRecord::Schema.define(version: 2021_09_08_153059) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.integer "total_token"
    t.integer "head_count"
    t.string "logo_pic"
    t.date "subscription_start"
    t.date "subscription_end"
    t.boolean "renewed", default: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "favourites", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "perk_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["perk_id"], name: "index_favourites_on_perk_id"
    t.index ["user_id"], name: "index_favourites_on_user_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "state"
    t.string "token_bundle"
    t.integer "amount_cents", default: 0, null: false
    t.string "checkout_session_id"
    t.bigint "user_id", null: false
    t.bigint "token_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["token_id"], name: "index_orders_on_token_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "perks", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "perk_pic"
    t.string "location"
    t.integer "token_cost"
    t.date "start_date"
    t.date "end_date"
    t.string "category"
    t.string "merchants"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "upvotes"
    t.float "latitude"
    t.float "longitude"
  end

  create_table "reviews", force: :cascade do |t|
    t.text "comment"
    t.float "rating"
    t.bigint "user_id"
    t.bigint "perk_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["perk_id"], name: "index_reviews_on_perk_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "tokens", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "price_cents", default: 0, null: false
    t.string "bundle"
    t.integer "amount"
  end

  create_table "user_perks", force: :cascade do |t|
    t.boolean "redeemed", default: false
    t.boolean "favourited", default: false
    t.bigint "user_id"
    t.bigint "perk_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["perk_id"], name: "index_user_perks_on_perk_id"
    t.index ["user_id"], name: "index_user_perks_on_user_id"
  end

  create_table "user_tokens", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "token_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["token_id"], name: "index_user_tokens_on_token_id"
    t.index ["user_id"], name: "index_user_tokens_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.string "profile_pic"
    t.boolean "admin", default: false
    t.boolean "model", default: false
    t.integer "token_allowance"
    t.string "unique_code"
    t.string "location"
    t.bigint "company_id", null: false
    t.float "latitude"
    t.float "longitude"
    t.integer "tokens_used"
    t.string "qr_code"
    t.index ["company_id"], name: "index_users_on_company_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "favourites", "perks"
  add_foreign_key "favourites", "users"
  add_foreign_key "orders", "tokens"
  add_foreign_key "orders", "users"
  add_foreign_key "user_tokens", "tokens"
  add_foreign_key "user_tokens", "users"
  add_foreign_key "users", "companies"
end
