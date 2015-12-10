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

ActiveRecord::Schema.define(version: 20151210003907) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cities", force: :cascade do |t|
    t.string   "name"
    t.integer  "size"
    t.integer  "open_housing"
    t.integer  "housing_cost"
    t.string   "politics"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "name_id"
  end

  create_table "cities_industries", id: false, force: :cascade do |t|
    t.integer "city_id",     null: false
    t.integer "industry_id", null: false
  end

  add_index "cities_industries", ["city_id", "industry_id"], name: "index_cities_industries_on_city_id_and_industry_id", using: :btree
  add_index "cities_industries", ["industry_id", "city_id"], name: "index_cities_industries_on_industry_id_and_city_id", using: :btree

  create_table "industries", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "type"
    t.integer  "type_id"
  end

  create_table "jobs", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "job_title"
    t.integer  "avg_salary"
    t.integer  "industry_id"
  end

  create_table "surveys", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "student_loan_pmt"
    t.integer  "jobs_id"
    t.string   "college"
  end

end