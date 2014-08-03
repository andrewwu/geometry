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

ActiveRecord::Schema.define(version: 20140803061631) do

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

  create_table "models_sizes", id: false, force: true do |t|
    t.integer "model_id"
    t.integer "size_id"
  end

  add_index "models_sizes", ["model_id", "size_id"], name: "index_models_sizes_on_model_id_and_size_id", unique: true
  add_index "models_sizes", ["model_id"], name: "index_models_sizes_on_model_id"
  add_index "models_sizes", ["size_id"], name: "index_models_sizes_on_size_id"

  create_table "sizes", force: true do |t|
    t.float    "frame_size"
    t.float    "top_tube"
    t.float    "head_tube"
    t.float    "head_tube_angle"
    t.float    "seat_tube"
    t.float    "seat_tube_angle"
    t.float    "bottom_bracket_drop"
    t.float    "front_center"
    t.float    "chainstay"
    t.float    "fork_rake"
    t.float    "trail"
    t.float    "wheelbase"
    t.float    "standover"
    t.float    "stack"
    t.float    "reach"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
