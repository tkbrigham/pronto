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
    t.integer  "station_id"
    t.integer  "status"
    t.boolean  "blocked"
    t.boolean  "suspended"
    t.boolean  "out_of_service"
    t.boolean  "has_key_dispenser"
    t.boolean  "has_keys_available"
    t.datetime "latest_update"
    t.datetime "latest_communication"
    t.integer  "docks_available"
    t.integer  "docks_unavailable"
    t.integer  "bikes_available"
    t.integer  "bikes_unavailable"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "station_stats", ["station_id"], name: "index_station_stats_on_station_id", using: :btree

  create_table "station_summaries", force: :cascade do |t|
    t.integer  "station_id",   null: false
    t.integer  "time_of_day"
    t.decimal  "avg_dock_a"
    t.decimal  "avg_dock_u"
    t.decimal  "avg_bike_a"
    t.decimal  "avg_bike_u"
    t.integer  "samples"
    t.integer  "last_stat_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "station_summaries", ["station_id"], name: "index_station_summaries_on_station_id", using: :btree
  add_index "station_summaries", ["time_of_day"], name: "index_station_summaries_on_time_of_day", using: :btree

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
