# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 0) do
  create_table "companies", charset: "utf8mb4", force: :cascade do |t|
    t.string "name", null: false
    t.string "telephone_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employees", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "company_id", null: false
    t.string "last_name", null: false
    t.string "first_name", null: false
    t.string "email"
    t.string "password_digest", null: false
    t.datetime "birthday"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_employees_on_company_id"
    t.index ["email"], name: "index_employees_on_email", unique: true
    t.index ["last_name"], name: "index_employees_on_last_name"
  end

  create_table "position_assignments", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "employee_id", null: false
    t.bigint "position_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_position_assignments_on_employee_id"
    t.index ["position_id"], name: "index_position_assignments_on_position_id"
  end

  create_table "positions", charset: "utf8mb4", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "company_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_positions_on_company_id"
  end

  create_table "stores", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "company_id", null: false
    t.string "name", null: false
    t.string "email"
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_stores_on_company_id"
  end

  create_table "work_shift_masters", charset: "utf8mb4", force: :cascade do |t|
    t.string "name", default: "その他", comment: "シフトの時間帯名 (ex. 夜勤)"
    t.datetime "start_time", null: false, comment: "シフトの開始時刻"
    t.datetime "end_time", null: false, comment: "シフトの終了時刻"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "work_shifts", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "store_id", null: false
    t.bigint "employee_id", null: false
    t.bigint "work_shift_master_id", null: false
    t.integer "day_of_week", null: false, comment: "シフトの曜日"
    t.index ["employee_id"], name: "index_work_shifts_on_employee_id"
    t.index ["store_id"], name: "index_work_shifts_on_store_id"
    t.index ["work_shift_master_id"], name: "index_work_shifts_on_work_shift_master_id"
  end

  add_foreign_key "employees", "companies"
  add_foreign_key "position_assignments", "employees"
  add_foreign_key "position_assignments", "positions"
  add_foreign_key "positions", "companies"
  add_foreign_key "stores", "companies"
  add_foreign_key "work_shifts", "employees"
  add_foreign_key "work_shifts", "stores"
  add_foreign_key "work_shifts", "work_shift_masters"
end
