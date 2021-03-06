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

ActiveRecord::Schema.define(version: 20190207173439) do

  create_table "candidates", force: :cascade do |t|
    t.text "name"
    t.text "role"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "looking_for"
    t.text "highlights"
    t.string "LinkedIn"
    t.string "GitHub"
    t.string "Behance"
    t.string "Dribbble"
    t.string "Angellist"
    t.text "other"
    t.text "location"
    t.index ["user_id", "created_at"], name: "index_candidates_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_candidates_on_user_id"
  end

  create_table "jobs", force: :cascade do |t|
    t.text "title"
    t.text "company"
    t.string "website"
    t.string "link"
    t.string "role"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "elevator_pitch"
    t.text "why_get_excited"
    t.text "description"
    t.text "location"
    t.index ["user_id", "created_at"], name: "index_jobs_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_jobs_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "remember_digest"
    t.boolean "admin", default: false
    t.string "activation_digest"
    t.boolean "activated", default: false
    t.datetime "activated_at"
    t.string "reset_digest"
    t.datetime "reset_sent_at"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
