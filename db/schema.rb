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

ActiveRecord::Schema.define(version: 20160310214633) do

  create_table "artists", force: :cascade do |t|
    t.string   "artist_name",      limit: 255
    t.text     "latest_single"
    t.string   "photo",            limit: 255
    t.string   "genre",            limit: 255
    t.decimal  "minimum_donation"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "target_amount"
    t.boolean  "met_target"
    t.datetime "target_date"
    t.decimal  "total_donation"
  end

  create_table "countries", force: :cascade do |t|
    t.string   "name"
    t.string   "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name",      limit: 255
    t.string   "last_name",       limit: 255
    t.date     "dob"
    t.string   "user_name",       limit: 255
    t.string   "email",           limit: 255
    t.string   "password_digest", limit: 255
    t.string   "photo",           limit: 255
    t.decimal  "balance"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "address"
    t.float    "latitude"
    t.float    "longitude"
  end

  create_table "voteartists", force: :cascade do |t|
    t.integer  "artist_id"
    t.integer  "user_id"
    t.integer  "country_id"
    t.decimal  "amount_paid"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

end
