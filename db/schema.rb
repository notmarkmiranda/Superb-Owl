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

ActiveRecord::Schema[7.0].define(version: 2023_04_03_190322) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "memberships", force: :cascade do |t|
    t.bigint "pool_id", null: false
    t.bigint "user_id", null: false
    t.boolean "active", default: true
    t.integer "role", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pool_id"], name: "index_memberships_on_pool_id"
    t.index ["user_id"], name: "index_memberships_on_user_id"
  end

  create_table "pools", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "user_id", null: false
    t.boolean "active", default: false
    t.boolean "locked", default: false
    t.integer "game", null: false
    t.boolean "finalized", default: false
    t.boolean "archived", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "public_pool", default: false
    t.index ["user_id"], name: "index_pools_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "nickname"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "memberships", "pools"
  add_foreign_key "memberships", "users"
  add_foreign_key "pools", "users"
end
