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

ActiveRecord::Schema.define(version: 20160120080853) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "candidate_statuses", force: :cascade do |t|
    t.string   "name",       limit: 256, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "candidates", force: :cascade do |t|
    t.string   "name",       limit: 256
    t.integer  "status",                 default: 1
    t.decimal  "fee"
    t.json     "contacts"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "candidates_skills", id: false, force: :cascade do |t|
    t.integer "candidate_id", null: false
    t.integer "skill_id",     null: false
  end

  create_table "skills", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "skills_vacancies", id: false, force: :cascade do |t|
    t.integer "vacancy_id", null: false
    t.integer "skill_id",   null: false
  end

  create_table "vacancies", force: :cascade do |t|
    t.string   "name",         null: false
    t.text     "description"
    t.datetime "added_at",     null: false
    t.integer  "added_by"
    t.datetime "expire_at"
    t.decimal  "fee"
    t.text     "contact_info"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

end
