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

ActiveRecord::Schema.define(version: 20160210190718) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admissions_officers", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password"
  end

  create_table "admissions_officers_questionnaires", force: :cascade do |t|
    t.text "course_goals"
    t.text "comments"
    t.text "reason_for_applying"
  end

  create_table "instructors", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password"
    t.string "course"
  end

  create_table "instructors_questionnaires", force: :cascade do |t|
    t.text    "strengths"
    t.text    "weaknesses"
    t.boolean "good_fit"
    t.text    "comments"
  end

  create_table "students", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password"
    t.string "course"
    t.text   "application_essay"
    t.string "application_status"
  end

end
