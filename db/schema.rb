# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_09_24_054655) do

  create_table "approvals", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "project_id", null: false
    t.string "level", null: false
    t.boolean "commit", default: false
    t.string "prelevel"
    t.string "appuser"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "file_uploads", force: :cascade do |t|
    t.string "category"
    t.string "file_name"
    t.date "mtg"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "pj_id"
    t.integer "project_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "no"
    t.string "company"
    t.string "charge"
    t.text "task"
    t.integer "y1801", default: 0, null: false
    t.integer "y1802", default: 0, null: false
    t.integer "y1803", default: 0, null: false
    t.integer "y1804", default: 0, null: false
    t.integer "y1805", default: 0, null: false
    t.integer "y1806", default: 0, null: false
    t.integer "y1807", default: 0, null: false
    t.integer "y1808", default: 0, null: false
    t.integer "y1809", default: 0, null: false
    t.integer "y1810", default: 0, null: false
    t.integer "y1811", default: 0, null: false
    t.integer "y1812", default: 0, null: false
    t.integer "y1901", default: 0, null: false
    t.integer "y1902", default: 0, null: false
    t.integer "y1903", default: 0, null: false
    t.integer "y1904", default: 0, null: false
    t.integer "y1905", default: 0, null: false
    t.integer "y1906", default: 0, null: false
    t.integer "y1907", default: 0, null: false
    t.integer "y1908", default: 0, null: false
    t.integer "y1909", default: 0, null: false
    t.integer "y1910", default: 0, null: false
    t.integer "y1911", default: 0, null: false
    t.integer "y1912", default: 0, null: false
    t.integer "y2001", default: 0, null: false
    t.integer "y2002", default: 0, null: false
    t.integer "y2003", default: 0, null: false
    t.integer "sum_int_month_rf"
    t.integer "sum_int_rf"
    t.integer "sum_int"
    t.date "contract"
    t.date "deposit"
    t.date "depomonth"
    t.date "inspe"
    t.date "insmonth"
    t.date "start"
    t.date "end"
    t.date "delivery"
    t.date "deliverymonth"
    t.integer "pjprice", default: 0, null: false
    t.float "plancost", default: 0.0, null: false
    t.float "realcost", default: 0.0, null: false
    t.text "remarks"
    t.float "pf", default: 1.0, null: false
    t.float "pfdummy", default: 1.0, null: false
    t.string "team"
    t.string "tech"
    t.string "salestype"
    t.string "level"
    t.integer "sum19", default: 0, null: false
    t.integer "sum19pf", default: 0, null: false
    t.integer "counta", default: 0, null: false
    t.integer "countb", default: 0, null: false
    t.integer "countc", default: 0, null: false
    t.integer "countd", default: 0, null: false
    t.integer "counte", default: 0, null: false
    t.integer "countf", default: 0, null: false
    t.integer "countg", default: 0, null: false
    t.boolean "forapp", default: false
    t.text "appnote"
    t.date "deposit2"
    t.date "depomonth2"
    t.string "deposittype"
  end

  create_table "recordholidays", force: :cascade do |t|
    t.integer "user_id", null: false
    t.date "rh"
    t.boolean "half", default: true, null: false
    t.boolean "alt", default: true, null: false
    t.boolean "commit", default: true, null: false
  end

  create_table "recordstates", force: :cascade do |t|
    t.string "name"
  end

  create_table "recordtimes", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "recordstate_id", null: false
    t.datetime "rt"
    t.boolean "commit", default: true, null: false
    t.boolean "night", default: false
    t.datetime "begin"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "admin", default: false
    t.string "fname"
    t.string "gname"
    t.string "usercode"
    t.boolean "superadmin", default: false
    t.boolean "atfinish", default: false
    t.boolean "atwork", default: false
    t.boolean "atrest", default: false
    t.integer "department_id"
    t.integer "altholiday", default: 0
    t.integer "paidholiday", default: 10
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
