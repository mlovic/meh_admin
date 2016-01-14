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

ActiveRecord::Schema.define(version: 20160113212940) do

  create_table "groups", force: :cascade do |t|
    t.string   "level"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "teacher_id"
    t.text     "schedule"
  end

  create_table "students", force: :cascade do |t|
    t.string   "name"
    t.date     "date_of_birth"
    t.string   "phone"
    t.string   "level"
    t.string   "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "group_id"
  end

  add_index "students", ["group_id"], name: "index_students_on_group_id"

  create_table "teachers", force: :cascade do |t|
    t.string "name"
    t.string "color"
  end

  create_table "weekly_classes", force: :cascade do |t|
    t.time     "starts_at"
    t.time     "ends_at"
    t.integer  "day_of_week"
    t.integer  "group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "weekly_classes", ["group_id"], name: "index_weekly_classes_on_group_id"

end
