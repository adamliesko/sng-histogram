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

ActiveRecord::Schema.define(version: 20141128193134) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "records", force: true do |t|
    t.xml      "xml_body"
    t.string   "title"
    t.string   "title_translated"
    t.text     "subject",          default: [], array: true
    t.text     "extent"
    t.string   "creator",          default: [], array: true
    t.string   "type",             default: [], array: true
    t.string   "created",          default: [], array: true
    t.string   "identifier",       default: [], array: true
    t.string   "provenance",       default: [], array: true
    t.text     "description",      default: [], array: true
    t.string   "format",           default: [], array: true
    t.string   "format_medium",    default: [], array: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "file_name"
  end

end
