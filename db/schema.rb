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

ActiveRecord::Schema.define(version: 2020_08_30_205835) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "texts", force: :cascade do |t|
    t.text "text"
    t.integer "readability"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "texts_users", force: :cascade do |t|
    t.bigint "text_id", null: false
    t.bigint "user_id", null: false
    t.index ["text_id"], name: "index_texts_users_on_text_id"
    t.index ["user_id"], name: "index_texts_users_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.integer "role"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "texts_users", "texts"
  add_foreign_key "texts_users", "users"
end
