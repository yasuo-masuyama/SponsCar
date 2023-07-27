# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2023_07_27_024653) do

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
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "admins", force: :cascade do |t|
    t.string "name", null: false
    t.string "name_kana", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "advertisements", force: :cascade do |t|
    t.string "title", null: false
    t.text "content", null: false
    t.string "heading", null: false
    t.integer "amounts", null: false
    t.boolean "is_active", default: true, null: false
    t.date "start_due_on", null: false
    t.date "end_due_on", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "sponsor_id", null: false
    t.bigint "genre_id", null: false
    t.index ["genre_id"], name: "index_advertisements_on_genre_id"
    t.index ["sponsor_id"], name: "index_advertisements_on_sponsor_id"
  end

  create_table "car_infos", force: :cascade do |t|
    t.bigint "driver_id", null: false
    t.string "manufacturer_name", null: false
    t.string "name", null: false
    t.string "flame_number", null: false
    t.string "license_plate", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["driver_id"], name: "index_car_infos_on_driver_id"
  end

  create_table "contacts", force: :cascade do |t|
    t.string "name", null: false
    t.string "company_name"
    t.string "telephone_number", null: false
    t.string "email", null: false
    t.text "content", null: false
    t.integer "work_status", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "drivers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name", null: false
    t.string "name_kana", null: false
    t.string "postal_code", null: false
    t.string "address", null: false
    t.string "telephone_number", null: false
    t.string "activity_area"
    t.boolean "is_active", default: true, null: false
    t.boolean "terms", default: false, null: false
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_drivers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_drivers_on_reset_password_token", unique: true
  end

  create_table "genres", force: :cascade do |t|
    t.string "name", null: false
    t.boolean "flag_active", default: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "infos", force: :cascade do |t|
    t.string "title", null: false
    t.text "content", null: false
    t.integer "viewer_type", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "sponsors", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "company_name", null: false
    t.string "company_name_kana", null: false
    t.string "ceo_name", null: false
    t.string "ceo_name_kana", null: false
    t.string "postal_code", null: false
    t.string "address", null: false
    t.string "telephone_number", null: false
    t.boolean "terms", default: false, null: false
    t.boolean "is_active", default: true, null: false
    t.integer "user_status", default: 0
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_sponsors_on_email", unique: true
    t.index ["reset_password_token"], name: "index_sponsors_on_reset_password_token", unique: true
  end

  create_table "transfer_infos", force: :cascade do |t|
    t.bigint "driver_id", null: false
    t.string "bank_name", null: false
    t.string "branch_name", null: false
    t.integer "account_number", null: false
    t.integer "account_type", null: false
    t.string "account_name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["driver_id"], name: "index_transfer_infos_on_driver_id"
  end

  create_table "under_deals", force: :cascade do |t|
    t.bigint "advertisement_id", null: false
    t.bigint "driver_id", null: false
    t.integer "work_status", default: 0, null: false
    t.text "installation_image"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "advertisements", "genres"
  add_foreign_key "advertisements", "sponsors"
  add_foreign_key "car_infos", "drivers"
  add_foreign_key "transfer_infos", "drivers"
end
