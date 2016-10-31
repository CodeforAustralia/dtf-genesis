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

ActiveRecord::Schema.define(version: 20161030152042) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contact_people", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
    t.string   "phone"
    t.string   "fax"
    t.string   "email"
  end

  create_table "contracts", force: :cascade do |t|
    t.string   "vt_contract_number"
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
    t.integer  "department_id"
    t.integer  "supplier_id"
    t.integer  "contact_id"
    t.integer  "contract_type_id"
    t.integer  "unspsc_id"
    t.integer  "project_id"
    t.string   "address"
    t.integer  "status_id"
  end

  create_table "departments", force: :cascade do |t|
    t.string   "name"
    t.string   "short_name"
    t.integer  "vt_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "department_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["department_id"], name: "index_projects_on_department_id", using: :btree
  end

  create_table "suppliers", force: :cascade do |t|
    t.string   "name"
    t.string   "abn"
    t.string   "acn"
    t.string   "address"
    t.string   "suburb"
    t.string   "state"
    t.integer  "postcode"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "unspscs", force: :cascade do |t|
    t.integer  "unspsc_code"
    t.string   "unspsc_name"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "unspsc_alias"
    t.string   "child_category"
    t.string   "parent_category"
  end

  add_foreign_key "projects", "departments"
end
