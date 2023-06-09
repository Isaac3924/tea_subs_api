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

ActiveRecord::Schema[7.0].define(version: 2023_06_01_081448) do
  create_table "customers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customers_subscriptions", id: false, force: :cascade do |t|
    t.integer "customer_id", null: false
    t.integer "subscription_id", null: false
    t.index ["customer_id", "subscription_id"], name: "index_customers_subscriptions_on_customer_id_and_subscription_id"
    t.index ["subscription_id", "customer_id"], name: "index_customers_subscriptions_on_subscription_id_and_customer_id"
  end

  create_table "subscriptions", force: :cascade do |t|
    t.string "title"
    t.float "price"
    t.string "status"
    t.string "frequency"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subscriptions_teas", id: false, force: :cascade do |t|
    t.integer "subscription_id", null: false
    t.integer "tea_id", null: false
    t.index ["subscription_id", "tea_id"], name: "index_subscriptions_teas_on_subscription_id_and_tea_id"
    t.index ["tea_id", "subscription_id"], name: "index_subscriptions_teas_on_tea_id_and_subscription_id"
  end

  create_table "teas", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.integer "temperature"
    t.integer "brew_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
