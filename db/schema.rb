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

ActiveRecord::Schema.define(version: 2021_01_11_101003) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "item_id"
    t.index ["item_id"], name: "index_bookings_on_item_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "cities", force: :cascade do |t|
    t.string "name"
  end

  create_table "items", force: :cascade do |t|
    t.bigint "user_id"
    t.string "name"
    t.index ["user_id"], name: "index_items_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.bigint "user_id"
    t.string "reviewable_type"
    t.bigint "reviewable_id"
    t.index ["reviewable_type", "reviewable_id"], name: "index_reviews_on_reviewable_type_and_reviewable_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.bigint "city_id"
    t.string "first_name"
    t.index ["city_id"], name: "index_users_on_city_id"
  end

end
