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

ActiveRecord::Schema[7.0].define(version: 2022_12_21_111636) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "customers", id: false, force: :cascade do |t|
    t.bigint "id"
    t.string "first_name"
    t.string "last_name"
    t.jsonb "default_address"
    t.string "email"
    t.boolean "verified_email"
    t.string "tax_exempt"
    t.string "tags"
    t.decimal "total_spent"
    t.string "phone"
    t.bigint "last_order_id"
    t.string "currency"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.text "line_items"
    t.float "current_total_tax"
    t.jsonb "current_total_tax_set"
    t.string "customer"
    t.text "discount_applications"
    t.string "email"
    t.string "financial_status"
    t.string "fulfillment_status"
    t.integer "number"
    t.jsonb "total_shipping_price_set"
    t.string "total_tax"
    t.integer "total_price"
    t.bigint "user_id"
    t.string "contact_email"
    t.integer "total_price_usd"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.bigint "product_id"
    t.string "handle"
    t.string "tags"
    t.string "title"
    t.text "images"
    t.text "options"
    t.string "status"
    t.text "variants"
    t.string "vendor"
    t.string "body_html"
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "transaction_histories", force: :cascade do |t|
    t.bigint "variant_id"
    t.integer "quantity"
    t.decimal "price"
    t.string "price_id"
    t.string "currency"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "variants", id: false, force: :cascade do |t|
    t.string "barcode"
    t.integer "position"
    t.string "compare_at_price"
    t.integer "grams"
    t.bigint "id"
    t.jsonb "option"
    t.string "price"
    t.integer "product_id"
    t.string "sku"
    t.boolean "taxable"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
