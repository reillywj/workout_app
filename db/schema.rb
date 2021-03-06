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

ActiveRecord::Schema.define(version: 20150304010923) do

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.string   "abbreviation"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cycles", force: :cascade do |t|
    t.string   "description"
    t.integer  "athlete_id"
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "exercises", force: :cascade do |t|
    t.string   "name"
    t.string   "nickname"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "subcategory_id"
  end

  create_table "goals", force: :cascade do |t|
    t.string   "description"
    t.string   "goalable_type"
    t.integer  "goalable_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "visibility"
    t.string   "status"
  end

  create_table "subcategories", force: :cascade do |t|
    t.string   "name"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "role"
  end

  create_table "workout_exercise_sets", force: :cascade do |t|
    t.integer  "set_number"
    t.integer  "reps_to_do"
    t.integer  "reps_completed"
    t.integer  "amount_to_do"
    t.integer  "amount_completed"
    t.integer  "workout_exercise_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "work_units"
    t.string   "rep_units"
    t.string   "relative_perceived_exertion"
  end

  create_table "workout_exercises", force: :cascade do |t|
    t.integer  "workout_id"
    t.integer  "exercise_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "order"
  end

  create_table "workouts", force: :cascade do |t|
    t.integer  "cycle_id"
    t.text     "notes"
    t.date     "workout_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
