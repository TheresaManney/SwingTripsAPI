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

ActiveRecord::Schema.define(version: 20170706225423) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "competitions", force: :cascade do |t|
    t.string   "level"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "finals",     default: false
    t.integer  "placement"
    t.integer  "trip_id"
    t.string   "comp_type"
    t.index ["trip_id"], name: "index_competitions_on_trip_id", using: :btree
  end

  create_table "travelers", force: :cascade do |t|
    t.string   "email"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "password_digest"
  end

  create_table "trips", force: :cascade do |t|
    t.string   "location"
    t.boolean  "event_paid"
    t.boolean  "hotel_reserved"
    t.boolean  "flight_paid"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.text     "details"
    t.integer  "traveler_id"
    t.string   "event_name"
    t.datetime "start_date"
    t.datetime "end_date"
    t.index ["traveler_id"], name: "index_trips_on_traveler_id", using: :btree
  end

end
