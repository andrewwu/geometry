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

ActiveRecord::Schema.define(version: 20140731044311) do

  create_table "manufacturers", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "manufacturers", ["name"], name: "index_manufacturers_on_name", unique: true

  create_table "models", force: true do |t|
    t.integer  "year"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "manufacturer_id"
  end

  create_table "sizes", force: true do |t|
    t.float    "frame_size"
    t.integer  "top_tube"
    t.integer  "head_tube"
    t.float    "head_tube_angle"
    t.integer  "seat_tube"
    t.float    "seat_tube_angle"
    t.integer  "bottom_bracket_drop"
    t.integer  "front_center"
    t.integer  "chainstay"
    t.integer  "fork_rake"
    t.integer  "trail"
    t.integer  "wheelbase"
    t.integer  "standover"
    t.integer  "stack"
    t.integer  "reach"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
