
namespace :backup do
  desc "Backup all avaliable databases"
  task :all => :environment do
    Rake::Task["backup:contacts"].invoke
    Rake::Task["backup:status"].invoke
    Rake::Task["backup:types"].invoke
    Rake::Task["backup:value_types"].invoke
    Rake::Task["backup:suppliers"].invoke
    Rake::Task["backup:contracts"].invoke
    Rake::Task["backup:councils"].invoke
    Rake::Task["backup:cpr"].invoke
    Rake::Task["backup:csr_contracts"].invoke
    Rake::Task["backup:csr"].invoke
    Rake::Task["backup:departments"].invoke
    Rake::Task["backup:location_codes"].invoke
    Rake::Task["backup:locations"].invoke
    Rake::Task["backup:projects"].invoke
    Rake::Task["backup:unspscs"].invoke
  end

  desc "Backup ContactPerson db"
  task :contacts => :environment do
    puts "Backup #{ContactPerson.all.count} ContactPerson"
    CSV.open("#{Rails.root}/db/backup/ContactPerson.csv", "wb", force_quotes: true) do |csv|
      csv << ["id", "name", "phone", "fax", "email"]
      ContactPerson.all.each do |x|
        csv << [x.id, x.name, x.phone, x.fax, x.email]
      end
    end
  end

  desc "Backup ContractStatus db"
  task :status => :environment do
    puts "Backup #{ContractStatus.all.count} ContractStatus"
    CSV.open("#{Rails.root}/db/backup/ContractStatus.csv", "wb", force_quotes: true) do |csv|
      csv << ["id", "name", "short_name"]
      ContractStatus.all.each do |x|
        csv << [x.id, x.name, x.short_name]
      end
    end
  end

  desc "Backup ContractType db"
  task :types => :environment do
    puts "Backup #{ContractType.all.count} ContractType"
    CSV.open("#{Rails.root}/db/backup/ContractType.csv", "wb", force_quotes: true) do |csv|
      csv << ["id", "name", "short_name"]
      ContractType.all.each do |x|
        csv << [x.id, x.name, x.short_name]
      end
    end
  end

  desc "Backup contract_value_types db"
  task :value_types => :environment do
    puts "Backup #{ContractValueType.all.count} ContractValueType"
    CSV.open("#{Rails.root}/db/backup/ContractValueType.csv", "wb", force_quotes: true) do |csv|
      csv << ["id", "type_description", "type_shortname"]
      ContractValueType.all.each do |x|
        csv << [x.id, x.type_description, x.type_shortname]
      end
    end
  end

  desc "Backup contracts db"
  task :contracts => :environment do
    puts "Backup #{Contract.all.count} Contract"
    CSV.open("#{Rails.root}/db/backup/Contract.csv", "wb", force_quotes: true) do |csv|
      csv << ["id", "vt_contract_number", "vt_title", "vt_start_date", "vt_end_date", "vt_total_value", "vt_department_id", "vt_contract_type_id", "vt_value_type_id", "status_index", "vt_unspc_id", "vt_contract_description", "vt_supplier_id", "project_id", "vt_address", "vt_status_id", "vt_address_id", "vt_agency_person", "vt_agency_phone", "vt_agency_email", "vt_supplier_name", "vt_supplier_abn", "vt_supplier_acn", "vt_supplier_address", "vt_supplier_email", "autopurge"]
      Contract.all.each do |x|
        csv << [x.id, x.vt_contract_number, x.vt_title, x.vt_start_date, x.vt_end_date, x.vt_total_value, x.vt_department_id, x.vt_contract_type_id, x.vt_value_type_id, x.status_index, x.vt_unspc_id, x.vt_contract_description, x.vt_supplier_id, x.project_id, x.vt_address, x.vt_status_id, x.vt_address_id, x.vt_agency_person, x.vt_agency_phone, x.vt_agency_email, x.vt_supplier_name, x.vt_supplier_abn, x.vt_supplier_acn, x.vt_supplier_address, x.vt_supplier_email, x.autopurge]
      end
    end
  end

  desc "Backup councils db"
  task :councils => :environment do
    puts "Backup #{Council.all.count} Council"
    CSV.open("#{Rails.root}/db/backup/Council.csv", "wb", force_quotes: true) do |csv|
      csv << ["id", "codename", "name", "shortname", "council_type", "region_code"]
      Council.all.each do |x|
        csv << [x.id, x.codename, x.name, x.shortname, x.council_type, x.region_code]
      end
    end
  end

  desc "Backup cpr_performance_reports db"
  task :cpr => :environment do
    puts "Backup #{CprPerformanceReport.all.count} CprPerformanceReport"
    CSV.open("#{Rails.root}/db/backup/CprPerformanceReport.csv", "wb", force_quotes: true) do |csv|
      csv << ["id", "cpr_contract", "cpr_supplier", "cpr_client", "cpr_principal", "cpr_report_date", "cpr_work_percent_complete", "cpr_report_reason", "cpr_price_as_varied", "cpr_predicted_price", "cpr_actual_price", "cpr_total_extention_days", "cpr_adjusted_completion_date", "cpr_predicted_completion_date", "cpr_actual_completion_date", "cpr_comments", "cpr_reporting_officer", "cpr_contractor_acknowlages", "cpr_validating_officer", "score_time_management", "score_work_standard", "score_quality_management_system", "score_personnel", "score_subcontractors", "score_contract_admin", "score_coop_relations", "score_health_and_safety", "score_industrial_relations", "score_environmental_management", "score_training_management", "score_design_contractor", "score_indigenous_participation"]
      CprPerformanceReport.all.each do |x|
        csv << [x.id, x.cpr_contract, x.cpr_supplier, x.cpr_client, x.cpr_principal, x.cpr_report_date, x.cpr_work_percent_complete, x.cpr_report_reason, x.cpr_price_as_varied, x.cpr_predicted_price, x.cpr_actual_price, x.cpr_total_extention_days, x.cpr_adjusted_completion_date, x.cpr_predicted_completion_date, x.cpr_actual_completion_date, x.cpr_comments, x.cpr_reporting_officer, x.cpr_contractor_acknowlages, x.cpr_validating_officer, x.score_time_management, x.score_work_standard, x.score_quality_management_system, x.score_personnel, x.score_subcontractors, x.score_contract_admin, x.score_coop_relations, x.score_health_and_safety, x.score_industrial_relations, x.score_environmental_management, x.score_training_management, x.score_design_contractor, x.score_indigenous_participation]
      end
    end
  end

  desc "Backup csr_contracts db"
  task :csr_contracts => :environment do
    puts "Backup #{CsrContract.all.count} CsrContract"
    CSV.open("#{Rails.root}/db/backup/CsrContract.csv", "wb", force_quotes: true) do |csv|
      csv << ["id", "csr_works_no", "csr_supplier_type", "csr_description", "csr_location", "csr_category", "csr_value", "csr_client", "csr_start_date", "csr_finish_date", "csr_comment", "source", "supplier_id"]
      CsrContract.all.each do |x|
        csv << [x.id, x.csr_works_no, x.csr_supplier_type, x.csr_description, x.csr_location, x.csr_category, x.csr_value, x.csr_client, x.csr_start_date, x.csr_finish_date, x.csr_comment, x.source, x.supplier_id]
      end
    end
  end

  desc "Backup csr_performance_reports db"
  task :csr => :environment do
    puts "Backup #{CsrPerformanceReport.all.count} CsrPerformanceReport"
    CSV.open("#{Rails.root}/db/backup/CsrPerformanceReport.csv", "wb", force_quotes: true) do |csv|
      csv << ["id", "csr_supplier_id", "csr_works_no", "csr_completion", "csr_createdby", "csr_progress", "csr_comment", "csr_progress_rate", "csr_staff_quality", "csr_work_quality", "csr_work_quantity", "csr_coodination", "csr_administration", "csr_expr1012", "csr_attitude_to_client", "csr_pricing", "csr_payment", "csr_ohs", "csr_ir", "csr_environment", "csr_overall", "csr_satisfactory", "supplier_id"]
      CsrPerformanceReport.all.each do |x|
        csv << [x.id, x.csr_supplier_id, x.csr_works_no, x.csr_completion, x.csr_createdby, x.csr_progress, x.csr_comment, x.csr_progress_rate, x.csr_staff_quality, x.csr_work_quality, x.csr_work_quantity, x.csr_coodination, x.csr_administration, x.csr_expr1012, x.csr_attitude_to_client, x.csr_pricing, x.csr_payment, x.csr_ohs, x.csr_ir, x.csr_environment, x.csr_overall, x.csr_satisfactory, x.supplier_id]
      end
    end
  end

  desc "Backup departments db"
  task :departments => :environment do
    puts "Backup #{Department.all.count} Department"
    CSV.open("#{Rails.root}/db/backup/Department.csv", "wb", force_quotes: true) do |csv|
      csv << ["id", "name", "short_name", "vt_number"]
      Department.all.each do |x|
        csv << [x.id, x.name, x.short_name, x.vt_number]
      end
    end
  end

  desc "Backup location_codes db"
  task :location_codes => :environment do
    puts "Backup #{LocationCode.all.count} LocationCode"
    CSV.open("#{Rails.root}/db/backup/LocationCode.csv", "wb", force_quotes: true) do |csv|
      csv << ["id", "code", "description"]
      LocationCode.all.each do |x|
        csv << [x.id, x.code, x.description]
      end
    end
  end

  desc "Backup locations db"
  task :locations => :environment do
    puts "Backup #{Location.all.count} Location"
    CSV.open("#{Rails.root}/db/backup/Location.csv", "wb", force_quotes: true) do |csv|
      csv << ["id", "record_no", "supplier_no", "location_code", "supplier_type", "mail_to", "address_line1", "address_line2", "suburb", "postcode", "po", "po_suburb", "po_postcode", "phone1", "phone2", "mobile", "fax", "email", "website", "title", "firstname", "surname", "updated", "state", "po_state", "metro"]
      Location.all.each do |x|
        csv << [x.id, x.record_no, x.supplier_no, x.location_code, x.supplier_type, x.mail_to, x.address_line1, x.address_line2, x.suburb, x.postcode, x.po, x.po_suburb, x.po_postcode, x.phone1, x.phone2, x.mobile, x.fax, x.email, x.website, x.title, x.firstname, x.surname, x.updated, x.state, x.po_state, x.metro]
      end
    end
  end

  desc "Backup projects db"
  task :projects => :environment do
    puts "Backup #{Project.all.count} Project"
    CSV.open("#{Rails.root}/db/backup/Project.csv", "wb", force_quotes: true) do |csv|
      csv << ["id", "title", "description", "department_id"]
      Project.all.each do |x|
        csv << [x.id, x.title, x.description, x.department_id]
      end
    end
  end

  desc "Backup suppliers db"
  task :suppliers => :environment do
    puts "Backup #{Supplier.all.count} Supplier"
    CSV.open("#{Rails.root}/db/backup/Supplier.csv", "wb", force_quotes: true) do |csv|
      csv << ["id", "name", "abn", "acn", "address", "suburb", "state", "postcode", "email"]
      Supplier.all.each do |x|
        csv << [x.id, x.name, x.abn, x.acn, x.address, x.suburb, x.state, x.postcode, x.email]
      end
    end
  end

  desc "Backup unspscs db"
  task :unspscs => :environment do
    puts "Backup #{Unspsc.all.count} Unspsc"
    CSV.open("#{Rails.root}/db/backup/Unspsc.csv", "wb", force_quotes: true) do |csv|
      csv << ["id", "unspsc_code", "unspsc_name", "unspsc_alias", "child_category", "parent_category"]
      Unspsc.all.each do |x|
        csv << [x.id, x.unspsc_code, x.unspsc_name, x.unspsc_alias, x.child_category, x.parent_category]
      end
    end
  end

end
