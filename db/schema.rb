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

ActiveRecord::Schema.define(version: 20130917140818) do

  create_table "chatrooms", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "chatrooms", ["name"], name: "index_chatrooms_on_name", unique: true

  create_table "cities", force: true do |t|
    t.string   "location"
    t.string   "zipcode"
    t.string   "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cities", ["slug"], name: "index_cities_on_slug"

  create_table "company_informations", force: true do |t|
    t.string   "area"
    t.string   "type"
    t.integer  "development_cost"
    t.integer  "legal_cost"
    t.integer  "office_space_cost"
    t.string   "business_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "developer_quantity",   default: 1.0
    t.float    "designer_quantity",    default: 1.0
    t.integer  "square_feet",          default: 200
    t.integer  "legal_hours",          default: 15
    t.integer  "domain_name_quantity", default: 1
  end

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "remember_password",      default: false
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "password_reset_sent_at"
    t.string   "password_reset_token"
  end

end
