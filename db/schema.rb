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

ActiveRecord::Schema.define(version: 20170106024818) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.string   "author_type"
    t.integer  "author_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree
  end

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "ccr_performance_reports", force: :cascade do |t|
    t.integer  "contract_id"
    t.integer  "supplier_id"
    t.string   "reporting_officer_name"
    t.string   "reporting_officer_email"
    t.string   "contract_type"
    t.integer  "department_id"
    t.string   "division"
    t.string   "contract_location"
    t.date     "practical_completion_estimate"
    t.date     "practical_completion"
    t.date     "final_report"
    t.money    "final_value",                   scale: 2
    t.date     "defects_liability"
    t.string   "supplier_name"
    t.string   "supplier_email"
    t.integer  "score_cost"
    t.integer  "score_time"
    t.integer  "score_admin"
    t.integer  "score_standards"
    t.integer  "score_quality"
    t.integer  "score_personnel"
    t.integer  "score_subcontract"
    t.integer  "score_communication"
    t.integer  "score_safety"
    t.integer  "score_environment"
    t.integer  "score_design"
    t.integer  "score_overall"
    t.string   "acceptance_name"
    t.string   "acceptance_email"
    t.integer  "acceptance_status"
    t.string   "executive_name"
    t.string   "executive_email"
    t.integer  "executive_status"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.index ["contract_id"], name: "index_ccr_performance_reports_on_contract_id", using: :btree
    t.index ["department_id"], name: "index_ccr_performance_reports_on_department_id", using: :btree
    t.index ["supplier_id"], name: "index_ccr_performance_reports_on_supplier_id", using: :btree
  end

  create_table "contact_people", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
    t.string   "phone"
    t.string   "fax"
    t.string   "email"
  end

  create_table "contract_statuses", force: :cascade do |t|
    t.string   "name"
    t.string   "short_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contract_types", force: :cascade do |t|
    t.string   "name"
    t.string   "short_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contract_value_types", force: :cascade do |t|
    t.string   "type_description"
    t.string   "type_shortname"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "contracts", force: :cascade do |t|
    t.string   "vt_contract_number"
    t.string   "vt_title"
    t.date     "vt_start_date"
    t.date     "vt_end_date"
    t.money    "vt_total_value",          scale: 2
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.integer  "vt_department_id"
    t.integer  "vt_contract_type_id"
    t.integer  "vt_value_type_id"
    t.integer  "status_index"
    t.integer  "vt_unspc_id"
    t.string   "vt_contract_description"
    t.integer  "vt_supplier_id"
    t.integer  "project_id"
    t.string   "vt_address"
    t.integer  "vt_status_id"
    t.integer  "vt_address_id"
    t.string   "vt_agency_person"
    t.string   "vt_agency_phone"
    t.string   "vt_agency_email"
    t.string   "vt_supplier_name"
    t.string   "vt_supplier_abn"
    t.string   "vt_supplier_acn"
    t.string   "vt_supplier_address"
    t.string   "vt_supplier_email"
    t.boolean  "autopurge"
    t.string   "ocds_id"
  end

  create_table "councils", force: :cascade do |t|
    t.string   "codename"
    t.string   "name"
    t.string   "shortname"
    t.string   "council_type"
    t.string   "region_code"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "cpr_performance_reports", force: :cascade do |t|
    t.integer  "cpr_contract"
    t.integer  "cpr_supplier"
    t.string   "cpr_client"
    t.string   "cpr_principal"
    t.date     "cpr_report_date"
    t.integer  "cpr_work_percent_complete"
    t.string   "cpr_report_reason"
    t.money    "cpr_price_as_varied",             scale: 2
    t.money    "cpr_predicted_price",             scale: 2
    t.money    "cpr_actual_price",                scale: 2
    t.integer  "cpr_total_extention_days"
    t.date     "cpr_adjusted_completion_date"
    t.date     "cpr_predicted_completion_date"
    t.date     "cpr_actual_completion_date"
    t.text     "cpr_comments"
    t.integer  "cpr_reporting_officer"
    t.boolean  "cpr_contractor_acknowlages"
    t.integer  "cpr_validating_officer"
    t.integer  "score_time_management"
    t.integer  "score_work_standard"
    t.integer  "score_quality_management_system"
    t.integer  "score_personnel"
    t.integer  "score_subcontractors"
    t.integer  "score_contract_admin"
    t.integer  "score_coop_relations"
    t.integer  "score_health_and_safety"
    t.integer  "score_industrial_relations"
    t.integer  "score_environmental_management"
    t.integer  "score_training_management"
    t.integer  "score_design_contractor"
    t.integer  "score_indigenous_participation"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.integer  "supplier_id"
    t.index ["supplier_id"], name: "index_cpr_performance_reports_on_supplier_id", using: :btree
  end

  create_table "csr_contacts", force: :cascade do |t|
    t.string   "csr_works_no"
    t.string   "csr_name"
    t.string   "csr_phone"
    t.string   "csr_dept_code"
    t.string   "csr_email"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "csr_contracts", force: :cascade do |t|
    t.string   "csr_works_no"
    t.string   "csr_supplier_type"
    t.text     "csr_description"
    t.string   "csr_location"
    t.string   "csr_category"
    t.money    "csr_value",         scale: 2
    t.string   "csr_client"
    t.date     "csr_start_date"
    t.date     "csr_finish_date"
    t.text     "csr_comment"
    t.string   "source",                      default: "csr"
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.integer  "supplier_id"
    t.integer  "csr_contact_id"
    t.index ["csr_contact_id"], name: "index_csr_contracts_on_csr_contact_id", using: :btree
    t.index ["supplier_id"], name: "index_csr_contracts_on_supplier_id", using: :btree
  end

  create_table "csr_performance_reports", force: :cascade do |t|
    t.string   "csr_supplier_id"
    t.string   "csr_works_no"
    t.boolean  "csr_completion"
    t.string   "csr_createdby"
    t.boolean  "csr_progress"
    t.text     "csr_comment"
    t.integer  "csr_progress_rate"
    t.integer  "csr_staff_quality"
    t.integer  "csr_work_quality"
    t.integer  "csr_work_quantity"
    t.integer  "csr_coodination"
    t.integer  "csr_administration"
    t.integer  "csr_expr1012"
    t.integer  "csr_attitude_to_client"
    t.integer  "csr_pricing"
    t.integer  "csr_payment"
    t.integer  "csr_ohs"
    t.integer  "csr_ir"
    t.integer  "csr_environment"
    t.integer  "csr_overall"
    t.boolean  "csr_satisfactory"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "supplier_id"
    t.index ["supplier_id"], name: "index_csr_performance_reports_on_supplier_id", using: :btree
  end

  create_table "departments", force: :cascade do |t|
    t.string   "name"
    t.string   "short_name"
    t.integer  "vt_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "location_codes", force: :cascade do |t|
    t.string "code"
    t.string "description"
  end

  create_table "locations", force: :cascade do |t|
    t.integer  "record_no"
    t.integer  "supplier_no"
    t.string   "location_code"
    t.string   "supplier_type"
    t.boolean  "mail_to"
    t.string   "address_line1"
    t.string   "address_line2"
    t.string   "suburb"
    t.integer  "postcode"
    t.string   "po"
    t.string   "po_suburb"
    t.string   "po_postcode"
    t.string   "phone1"
    t.string   "phone2"
    t.string   "mobile"
    t.string   "fax"
    t.string   "email"
    t.string   "website"
    t.string   "title"
    t.string   "firstname"
    t.string   "surname"
    t.date     "updated"
    t.string   "state"
    t.string   "po_state"
    t.boolean  "metro"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
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

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "ccr_performance_reports", "contracts"
  add_foreign_key "ccr_performance_reports", "departments"
  add_foreign_key "ccr_performance_reports", "suppliers"
  add_foreign_key "cpr_performance_reports", "suppliers"
  add_foreign_key "csr_contracts", "csr_contacts"
  add_foreign_key "csr_contracts", "suppliers"
  add_foreign_key "csr_performance_reports", "suppliers"
  add_foreign_key "projects", "departments"
end
