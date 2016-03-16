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

ActiveRecord::Schema.define(version: 20160310013716) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "station_stats", force: :cascade do |t|
    t.integer  "station_id",           null: false
    t.integer  "timestamp"
    t.integer  "status"
    t.boolean  "blocked"
    t.boolean  "suspended"
    t.boolean  "out_of_service"
    t.boolean  "has_key_dispenser"
    t.boolean  "has_keys_available"
    t.datetime "latest_update"
    t.datetime "latest_communication"
    t.integer  "docks_a"
    t.integer  "docks_u"
    t.integer  "bikes_a"
    t.integer  "bikes_u"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "station_summaries", force: :cascade do |t|
    t.integer  "station_id",             null: false
    t.integer  "timestamp"
    t.integer  "tot_dock_a", default: 0
    t.integer  "tot_dock_u", default: 0
    t.integer  "tot_bike_a", default: 0
    t.integer  "tot_bike_u", default: 0
    t.integer  "samples",    default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "station_summaries", ["station_id"], name: "index_station_summaries_on_station_id", using: :btree
  add_index "station_summaries", ["timestamp"], name: "index_station_summaries_on_timestamp", using: :btree

  create_table "stations", force: :cascade do |t|
    t.integer  "pronto_id",            null: false
    t.string   "station_name"
    t.string   "terminal_name"
    t.integer  "status"
    t.boolean  "blocked"
    t.boolean  "suspended"
    t.boolean  "out_of_service"
    t.datetime "latest_update"
    t.datetime "latest_communication"
    t.boolean  "has_key_dispenser"
    t.boolean  "has_keys_available"
    t.decimal  "lat"
    t.decimal  "lon"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "stations", ["pronto_id"], name: "index_stations_on_pronto_id", using: :btree

  add_foreign_key "station_stats", "stations"
  add_foreign_key "station_summaries", "stations"
end
