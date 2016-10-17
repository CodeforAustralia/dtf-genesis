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

ActiveRecord::Schema.define(version: 20161017035937) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contracts", force: :cascade do |t|
    t.string   "contract_number"
    t.string   "status"
    t.string   "title"
    t.date     "start_date"
    t.date     "end_date"
    t.money    "total_value",          scale: 2
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "department_index"
    t.integer  "contract_type_index"
    t.integer  "value_type_index"
    t.integer  "status_index"
    t.integer  "unspc_code"
    t.text     "contract_description"
  end

  create_table "departments", force: :cascade do |t|
    t.string   "name"
    t.string   "short_name"
    t.integer  "vt_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
