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

ActiveRecord::Schema.define(version: 20140302075208) do

  create_table "ACTIVITY", force: true do |t|
    t.string   "name"
    t.integer  "customerId"
    t.date     "startDate"
    t.date     "endDate"
    t.text     "description"
    t.text     "logoUrl"
    t.text     "posterUrl"
    t.integer  "mallid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "CUSTOMER", force: true do |t|
    t.string   "name"
    t.integer  "typeid"
    t.text     "address"
    t.string   "phone"
    t.text     "description"
    t.text     "logo1url"
    t.text     "map"
    t.text     "posterUrl"
    t.boolean  "obsolete"
    t.integer  "mallid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "CUSTOMERTYPE", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "status"
    t.integer  "mallid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "GATEWAYS", force: true do |t|
    t.integer  "mallid"
    t.string   "deviceid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "GOODS", force: true do |t|
    t.string   "name"
    t.integer  "customerId"
    t.decimal  "price",         precision: 15, scale: 2
    t.decimal  "discountprice", precision: 15, scale: 2
    t.integer  "goodstypeId"
    t.integer  "mallid"
    t.date     "createDate"
    t.text     "description"
    t.text     "logo1url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "GOODS_TYPES", force: true do |t|
    t.string  "name"
    t.boolean "status"
    t.integer "weight"
    t.integer "category"
    t.integer "mallid"
  end

  create_table "HOMEPAGELOCS", force: true do |t|
    t.string   "loctype"
    t.integer  "location"
    t.integer  "itemid"
    t.integer  "mallid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "MALLS", force: true do |t|
    t.string   "name"
    t.string   "version"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "USERS", force: true do |t|
    t.string   "name"
    t.string   "password"
    t.string   "role"
    t.integer  "mallid"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
