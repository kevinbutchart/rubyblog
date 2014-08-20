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

ActiveRecord::Schema.define(version: 20140820071132) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "day_record3s", force: true do |t|
    t.date     "logdate"
    t.time     "amintime"
    t.time     "amouttime"
    t.time     "pmintime"
    t.time     "pmouttime"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "day_record4s", force: true do |t|
    t.date     "logdate"
    t.text     "inout"
    t.decimal  "hours"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "day_record5s", force: true do |t|
    t.date     "logdate"
    t.time     "in1"
    t.time     "out1"
    t.time     "in2"
    t.time     "out2"
    t.decimal  "hours"
    t.text     "summary"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "time_record3s", force: true do |t|
    t.datetime "time"
    t.text     "recordtype"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
