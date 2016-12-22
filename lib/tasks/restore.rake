
namespace :restore do
  desc "Restore all avaliable databases"
  task :all => :environment do
    Rake::Task["restore:contacts"].invoke
    Rake::Task["restore:status"].invoke
    Rake::Task["restore:types"].invoke
    Rake::Task["restore:value_types"].invoke
    Rake::Task["restore:suppliers"].invoke
    Rake::Task["restore:contracts"].invoke
    Rake::Task["restore:councils"].invoke
    Rake::Task["restore:cpr"].invoke
    Rake::Task["restore:csr_contracts"].invoke
    Rake::Task["restore:csr"].invoke
    Rake::Task["restore:departments"].invoke
    Rake::Task["restore:location_codes"].invoke
    Rake::Task["restore:locations"].invoke
    Rake::Task["restore:projects"].invoke
    Rake::Task["restore:unspscs"].invoke
  end

  desc "Restore ContactPerson db"
  task :contacts => :environment do
    add_count = 0
    update_count = 0
    CSV.foreach("#{Rails.root}/db/backup/ContactPerson.csv", {force_quotes: true, headers: true}) do |row|
      match = ContactPerson.where(id: row[0]).first
      if match
        match.name = row[1]
        match.phone = row[2]
        match.fax = row[3]
        match.email = row[4]
        match.save
        update_count += 1
      else
        ContractStatus.create!({
          id: row[0],
          name: row[1],
          phone: row[2],
          fax: row[3],
          email: row[4]
        })
        add_count += 1
      end
    end
    puts "Updated #{update_count} and restored #{add_count} ContactPerson"
  end

  desc "Restore ContractStatus db"
  task :status => :environment do
    add_count = 0
    update_count = 0
    CSV.foreach("#{Rails.root}/db/backup/ContractStatus.csv", {force_quotes: true, headers: true}) do |row|
      match = ContractStatus.where(id: row[0]).first
      if match
        match.name = row[1]
        match.short_name = row[2]
        match.save
        update_count += 1
      else
        ContractStatus.create!({
          id: row[0],
          name: row[1],
          short_name: row[2]
          })
          add_count += 1
      end
    end
    puts "Updated #{update_count} and restored #{add_count} ContractStatus"
  end

  desc "Restore ContractType db"
  task :types => :environment do
    add_count = 0
    update_count = 0
    CSV.foreach("#{Rails.root}/db/backup/ContractType.csv", {force_quotes: true, headers: true}) do |row|
      match = ContractType.where(id: row[0]).first
      if match
        match.name = row[1]
        match.short_name = row[2]
        match.save
        update_count += 1
      else
        Unspsc.create!({
          id: row[0],
          name: row[1],
          short_name: row[2]
          })
          add_count += 1
      end
    end
    puts "Updated #{update_count} and restored #{add_count} ContractType"
  end

  desc "Restore ContractValueType db"
  task :value_types => :environment do
    add_count = 0
    update_count = 0
    CSV.foreach("#{Rails.root}/db/backup/ContractValueType.csv", {force_quotes: true, headers: true}) do |row|
      match = ContractValueType.where(id: row[0]).first
      if match
        match.type_description = row[1]
        match.type_shortname = row[2]
        match.save
        update_count += 1
      else
        ContractValueType.create!({
          id: row[0],
          type_description: row[1],
          type_shortname: row[2]
          })
          add_count += 1
      end
    end
    puts "Updated #{update_count} and restored #{add_count} ContractValueType"
  end

  desc "Restore Contract db"
  task :contracts => :environment do
    add_count = 0
    update_count = 0
    CSV.foreach("#{Rails.root}/db/backup/Contract.csv", {force_quotes: true, headers: true}) do |row|
      match = Contract.where(id: row[0]).first
      if match
        match.vt_contract_number = row[1]
        match.vt_title = row[2]
        match.vt_start_date = row[3]
        match.vt_end_date = row[4]
        match.vt_total_value = row[5]
        match.vt_department_id = row[6]
        match.vt_contract_type_id = row[7]
        match.vt_value_type_id = row[8]
        match.status_index = row[9]
        match.vt_unspc_id = row[10]
        match.vt_contract_description = row[11]
        match.vt_supplier_id = row[12]
        match.project_id = row[13]
        match.vt_address = row[14]
        match.vt_status_id = row[15]
        match.vt_address_id = row[16]
        match.save
        update_count += 1
      else
        Contract.create!({
          id: row[0],
          vt_contract_number: row[1],
          vt_title: row[2],
          vt_start_date: row[3],
          vt_end_date: row[4],
          vt_total_value: row[5],
          vt_department_id: row[6],
          vt_contract_type_id: row[7],
          vt_value_type_id: row[8],
          status_index: row[9],
          vt_unspc_id: row[10],
          vt_contract_description: row[11],
          vt_supplier_id: row[12],
          project_id: row[13],
          vt_address: row[14],
          vt_status_id: row[15],
          vt_address_id: row[16]
        })
        add_count += 1
      end
    end
    puts "Updated #{update_count} and restored #{add_count} Contract"
  end

  desc "Restore Council db"
  task :councils => :environment do
    add_count = 0
    update_count = 0
    CSV.foreach("#{Rails.root}/db/backup/Council.csv", {force_quotes: true, headers: true}) do |row|
      match = Council.where(id: row[0]).first
      if match
        match.codename = row[1]
        match.name = row[2]
        match.shortname = row[3]
        match.council_type = row[4]
        match.region_code = row[5]
        match.save
        update_count += 1
      else
        Council.create!({
          id: row[0],
          codename: row[1],
          name: row[2],
          shortname: row[3],
          council_type: row[4],
          region_code: row[5]
        })
        add_count += 1
      end
    end
    puts "Updated #{update_count} and restored #{add_count} Council"
  end

  desc "Restore CprPerformanceReport db"
  task :cpr => :environment do
    add_count = 0
    update_count = 0
    CSV.foreach("#{Rails.root}/db/backup/CprPerformanceReport.csv", {force_quotes: true, headers: true}) do |row|
      match = CprPerformanceReport.where(id: row[0]).first
      if match
        match.cpr_contract = row[1]
        match.cpr_supplier = row[2]
        match.cpr_client = row[3]
        match.cpr_principal = row[4]
        match.cpr_report_date = row[5]
        match.cpr_work_percent_complete = row[6]
        match.cpr_report_reason = row[7]
        match.cpr_price_as_varied = row[8]
        match.cpr_predicted_price = row[9]
        match.cpr_actual_price = row[10]
        match.cpr_total_extention_days = row[11]
        match.cpr_adjusted_completion_date = row[12]
        match.cpr_predicted_completion_date = row[13]
        match.cpr_actual_completion_date = row[14]
        match.cpr_comments = row[15]
        match.cpr_reporting_officer = row[16]
        match.cpr_contractor_acknowlages = row[17]
        match.cpr_validating_officer = row[18]
        match.score_time_management = row[19]
        match.score_work_standard = row[20]
        match.score_quality_management_system = row[21]
        match.score_personnel = row[22]
        match.score_subcontractors = row[23]
        match.score_contract_admin = row[24]
        match.score_coop_relations = row[25]
        match.score_health_and_safety = row[26]
        match.score_industrial_relations = row[27]
        match.score_environmental_management = row[28]
        match.score_training_management = row[29]
        match.score_design_contractor = row[30]
        match.score_indigenous_participation = row[31]
        match.save
        update_count += 1
      else
        CprPerformanceReport.create!({
          id: row[0],
          cpr_contract: row[1],
          cpr_supplier: row[2],
          cpr_client: row[3],
          cpr_principal: row[4],
          cpr_report_date: row[5],
          cpr_work_percent_complete: row[6],
          cpr_report_reason: row[7],
          cpr_price_as_varied: row[8],
          cpr_predicted_price: row[9],
          cpr_actual_price: row[10],
          cpr_total_extention_days: row[11],
          cpr_adjusted_completion_date: row[12],
          cpr_predicted_completion_date: row[13],
          cpr_actual_completion_date: row[14],
          cpr_comments: row[15],
          cpr_reporting_officer: row[16],
          cpr_contractor_acknowlages: row[17],
          cpr_validating_officer: row[18],
          score_time_management: row[19],
          score_work_standard: row[20],
          score_quality_management_system: row[21],
          score_personnel: row[22],
          score_subcontractors: row[23],
          score_contract_admin: row[24],
          score_coop_relations: row[25],
          score_health_and_safety: row[26],
          score_industrial_relations: row[27],
          score_environmental_management: row[28],
          score_training_management: row[29],
          score_design_contractor: row[30],
          score_indigenous_participation: row[31]
        })
        add_count += 1
      end
    end
    puts "Updated #{update_count} and restored #{add_count} CprPerformanceReport"
  end

  desc "Restore CsrContract db"
  task :csr_contracts => :environment do
    add_count = 0
    update_count = 0
    CSV.foreach("#{Rails.root}/db/backup/CsrContract.csv", {force_quotes: true, headers: true}) do |row|
      match = CsrContract.where(id: row[0]).first
      if match
        match.csr_works_no = row[1]
        match.csr_supplier_type = row[2]
        match.csr_description = row[3]
        match.csr_location = row[4]
        match.csr_value = row[5]
        match.csr_client = row[6]
        match.csr_start_date = row[7]
        match.csr_finish_date = row[8]
        match.csr_comment = row[9]
        match.source = row[10]
        match.supplier_id = row[11]
        match.save
        update_count += 1
      else
        CsrContract.create!({
          id: row[0],
          csr_works_no: row[1],
          csr_supplier_type: row[2],
          csr_description: row[3],
          csr_location: row[4],
          csr_value: row[5],
          csr_client: row[6],
          csr_start_date: row[7],
          csr_finish_date: row[8],
          csr_comment: row[9],
          source: row[10],
          supplier_id: row[11]
        })
        add_count += 1
      end
    end
    puts "Updated #{update_count} and restored #{add_count} CsrContract"
  end

  desc "Restore CsrPerformanceReport db"
  task :csr => :environment do
    add_count = 0
    update_count = 0
    CSV.foreach("#{Rails.root}/db/backup/CsrPerformanceReport.csv", {force_quotes: true, headers: true}) do |row|
      match = CsrPerformanceReport.where(id: row[0]).first
      if match
        match.csr_supplier_id = row[1]
        match.csr_works_no = row[2]
        match.csr_completion = row[3]
        match.csr_createdby = row[4]
        match.csr_progress = row[5]
        match.csr_comment = row[6]
        match.csr_progress_rate = row[7]
        match.csr_staff_quality = row[8]
        match.csr_work_quality = row[9]
        match.csr_work_quantity = row[10]
        match.csr_coodination = row[11]
        match.csr_administration = row[12]
        match.csr_expr1012 = row[13]
        match.csr_attitude_to_client = row[14]
        match.csr_pricing = row[15]
        match.csr_payment = row[16]
        match.csr_ohs = row[17]
        match.csr_ir = row[18]
        match.csr_environment = row[19]
        match.csr_overall = row[20]
        match.csr_satisfactory = row[21]
        match.supplier_id = row[22]
        match.save
        update_count += 1
      else
        CsrPerformanceReport.create!({
          csr_supplier_id: row[0], # could be just "id"
          csr_works_no: row[1],
          csr_completion: row[2],
          csr_createdby: row[3],
          csr_progress: row[4],
          csr_comment: row[5],
          csr_progress_rate: row[6],
          csr_staff_quality: row[7],
          csr_work_quality: row[8],
          csr_work_quantity: row[9],
          csr_coodination: row[10],
          csr_administration: row[11],
          csr_expr1012: row[12],
          csr_attitude_to_client: row[13],
          csr_pricing: row[14],
          csr_payment: row[15],
          csr_ohs: row[16],
          csr_ir: row[17],
          csr_environment: row[18],
          csr_overall: row[19],
          csr_satisfactory: row[20],
          supplier_id: row[21]
        })
        add_count += 1
      end
    end
    puts "Updated #{update_count} and restored #{add_count} CsrPerformanceReport"
  end

  desc "Restore Department db" #verified
  task :departments => :environment do
    add_count = 0
    update_count = 0
    CSV.foreach("#{Rails.root}/db/backup/Department.csv", {force_quotes: true, headers: true}) do |row|
      match = Department.where(id: row[0]).first
      if match
        match.name = row[1]
        match.short_name = row[2]
        match.vt_number = row[3]
        match.save
        update_count += 1
      else
        Department.create!({
          id: row[0],
          name: row[1],
          short_name: row[2],
          vt_number: row[3]
        })
        add_count += 1
      end
    end
    puts "Updated #{update_count} and restored #{add_count} Department"
  end

  desc "Restore LocationCode db"
  task :location_codes => :environment do
    add_count = 0
    update_count = 0
    CSV.foreach("#{Rails.root}/db/backup/LocationCode.csv", {force_quotes: true, headers: true}) do |row|
      match = LocationCode.where(id: row[0]).first
      if match
        match.code = row[1]
        match.description = row[2]
        match.save
        update_count += 1
      else
        LocationCode.create!({
          code: row[1],
          description: row[2]
        })
        add_count += 1
      end
    end
    puts "Updated #{update_count} and restored #{add_count} LocationCode"
  end

  desc "Restore Location db"
  task :locations => :environment do
    add_count = 0
    update_count = 0
    CSV.foreach("#{Rails.root}/db/backup/Location.csv", {force_quotes: true, headers: true}) do |row|
      match = Location.where(id: row[0]).first
      if match
        match.record_no = row[1]
        match.location_code = row[2]
        match.supplier_type = row[3]
        match.mail_to = row[4]
        match.address_line1 = row[5]
        match.address_line2 = row[6]
        match.suburb = row[7]
        match.postcode = row[8]
        match.po = row[9]
        match.po_suburb = row[10]
        match.po_postcode = row[11]
        match.phone1 = row[12]
        match.phone2 = row[13]
        match.mobile = row[14]
        match.fax = row[15]
        match.email = row[16]
        match.website = row[17]
        match.title = row[18]
        match.firstname = row[19]
        match.surname = row[20]
        match.updated = row[21]
        match.state = row[22]
        match.po_state = row[23]
        match.metro = row[24]
        match.save
        update_count += 1
      else
        Location.create!({
          id: row[0],
          record_no: row[1],
          location_code: row[2],
          supplier_type: row[3],
          mail_to: row[4],
          address_line1: row[5],
          address_line2: row[6],
          suburb: row[7],
          postcode: row[8],
          po: row[9],
          po_suburb: row[10],
          po_postcode: row[11],
          phone1: row[12],
          phone2: row[13],
          mobile: row[14],
          fax: row[15],
          email: row[16],
          website: row[17],
          title: row[18],
          firstname: row[19],
          surname: row[20],
          updated: row[21],
          state: row[22],
          po_state: row[23],
          metro: row[24]
        })
        add_count += 1
      end
    end
    puts "Updated #{update_count} and restored #{add_count} Location"
  end

  desc "Restore Project db"
  task :projects => :environment do
    add_count = 0
    update_count = 0
    CSV.foreach("#{Rails.root}/db/backup/Project.csv", {force_quotes: true, headers: true}) do |row|
      match = Project.where(id: row[0]).first
      if match
        match.title = row[1]
        match.description = row[2]
        match.department_id = row[3]
        match.save
        update_count += 1
      else
        Project.create!({
          id: row[0],
          title: row[1],
          description: row[2],
          department_id: row[3]
        })
        add_count += 1
      end
    end
    puts "Updated #{update_count} and restored #{add_count} Project"
  end

  desc "Restore Supplier db"
  task :suppliers => :environment do
    add_count = 0
    update_count = 0
    CSV.foreach("#{Rails.root}/db/backup/Supplier.csv", {force_quotes: true, headers: true}) do |row|
      match = Supplier.where(id: row[0]).first
      if match
        match.name = row[1]
        match.abn = row[2]
        match.acn = row[3]
        match.address = row[4]
        match.suburb = row[5]
        match.state = row[6]
        match.postcode = row[7]
        match.email = row[8]
        match.save
        update_count += 1
      else
        Supplier.create!({
          id: row[0],
          name: row[1],
          abn: row[2],
          acn: row[3],
          address: row[4],
          suburb: row[5],
          state: row[6],
          postcode: row[7],
          email: row[8]
        })
        add_count += 1
      end
    end
    puts "Updated #{update_count} and restored #{add_count} Supplier"
  end

  desc "Restore unspscs db"
  task :unspscs => :environment do
    add_count = 0
    update_count = 0
    CSV.foreach("#{Rails.root}/db/backup/Unspsc.csv", {force_quotes: true, headers: true}) do |row|
      match = Unspsc.where(id: row[0]).first
      if match
        match.unspsc_code = row[1]
        match.unspsc_name = row[2]
        match.unspsc_alias = row[3]
        match.child_category = row[4]
        match.parent_category = row[5]
        match.save
        update_count += 1
      else
        Unspsc.create!({
          id: row[0],
          unspsc_code: row[1],
          unspsc_name: row[2],
          unspsc_alias: row[3],
          child_category: row[4],
          parent_category: row[5]
          })
          add_count += 1
      end
    end
    puts "Updated #{update_count} and restored #{add_count} Unspsc"
  end

end
