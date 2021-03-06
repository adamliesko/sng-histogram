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

ActiveRecord::Schema.define(version: 20141129104349) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "artists", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "dominant_color"
  end

  add_index "artists", ["name"], name: "name_idx", using: :btree

  create_table "artists_records", id: false, force: true do |t|
    t.integer "artist_id"
    t.integer "record_id"
  end

  create_table "eras", force: true do |t|
    t.integer  "date_from"
    t.integer  "date_to"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "artist_id"
    t.json     "histogram"
  end

  create_table "histograms", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "artist_id"
  end

  add_index "histograms", ["artist_id"], name: "fk_artist_id_2", using: :btree

  create_table "records", force: true do |t|
    t.json     "attrs"
    t.string   "title",            default: [], array: true
    t.string   "title_translated", default: [], array: true
    t.text     "subject",          default: [], array: true
    t.text     "extent",           default: [], array: true
    t.string   "creator",          default: [], array: true
    t.string   "type",             default: [], array: true
    t.string   "created",          default: [], array: true
    t.string   "identifier",       default: [], array: true
    t.string   "provenance",       default: [], array: true
    t.text     "description",      default: [], array: true
    t.string   "format",           default: [], array: true
    t.string   "format_medium",    default: [], array: true
    t.string   "subject_place",    default: [], array: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "file_name"
    t.integer  "artist_ids",       default: [], array: true
    t.integer  "artist_id"
    t.json     "histogram"
  end

  add_index "records", ["artist_id"], name: "fk_artist_id", using: :btree

end
