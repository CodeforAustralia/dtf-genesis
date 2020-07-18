require 'csv'

namespace :migrate do
  desc "Migrate data for location(or address table in csr)"
  task :location => :environment do
  end

  desc "Migrate council lists"
  task :council => :environment do
    councils = CSV.read("#{Rails.root}/db/data/council.csv")
    columns = [:codename, :name, :shortname, :council_type, :region_code]
    Council.import columns, councils, validate: false
  end

  desc "Migrate unspsc codes"
  task :unspsc => :environment do
    unspscs = CSV.read("#{Rails.root}/db/data/unspsc.csv")
    columns = [:unspsc_code, :unspsc_name]
    Unspsc.import columns, unspscs, validate: false
  end

  desc "Migrate csr supplier data"
  task :supplier => :environment do
    suppliers = CSV.read("#{Rails.root}/db/data/supplier.csv")
    # putting :id here overrides supplier table to use SupplierID as reference instead of default
    columns = [:id, :name, :abn, :acn, :address, :suburb, :state, :postcode, :email]
    Supplier.import columns, suppliers, validate: false
  end

  desc "Migrate CSR performance report data"
  task :performance => :environment do
    performances = CSV.read("#{Rails.root}/db/data/performance.csv")
    # Need to add CSR Supplier Id because there are many instances of it and cannot be use as unique id
    columns = [:csr_supplier_id, :csr_works_no, :csr_completion, :csr_createdby, :csr_progress, :csr_comment, :csr_progress_rate, :csr_staff_quality, :csr_work_quality, :csr_work_quantity, :csr_coodination, :csr_administration, :csr_expr1012, :csr_attitude_to_client, :csr_pricing, :csr_payment, :csr_ohs, :csr_ir, :csr_environment, :csr_overall, :csr_satisfactory ]
    CsrPerformanceReport.import columns, performances, validate: false
  end

  desc "Migrate CSR Contracts data"
  task :csr_contract => :environment do
    # CsrContract.delete_all
    contracts = CSV.read("#{Rails.root}/db/data/csr_contract.csv")
    # Using csr_project_id as the unique key as included in the import file
    columns = [:id, :csr_works_no, :csr_supplier_type, :csr_description, :csr_location, :csr_category, :csr_value, :csr_client, :csr_start_date, :csr_finish_date, :csr_comment, :supplier_id]
    CsrContract.import columns, contracts, validate: false
  end

  desc "Setup Agency Data"
  task :agency => :environment do
    Department.delete_all
    agencies = CSV.read("#{Rails.root}/db/data/agencies.csv")
    columns = [:vt_number, :name, :short_name]
    Department.import columns, agencies, validate: false
  end

  desc "Setup Contract Status values"
  task :contract_status => :environment do
    ContractStatus.delete_all
    status_codes = CSV.read("#{Rails.root}/db/data/contract-status.csv")
    columns = [:name, :short_name]
    ContractStatus.import columns, status_codes, validate: false
  end

  desc "Setup Contract Type values"
  task :contract_types => :environment do
    ContractType.delete_all
    type_codes = CSV.read("#{Rails.root}/db/data/contract-types.csv")
    columns = [:name, :short_name]
    ContractType.import columns, type_codes, validate: false
  end

  desc "Import Tenders Vic data file"
  task :tendersvic => :environment do
    puts "Importing Vic Tenders data"
    count = 0
    CSV.foreach("#{Rails.root}/db/data/tendersvic_mock_contracts.csv", {quote_char: "'"}) do |row|
      if row[13] # standard
        s_name = row[13]
        s_abn = row[14]
        s_acn = row[15]
        s_address = row[16]
        s_suburb = row[17]
        s_state = row[18]
        s_pc = row[19]
        s_email = row[20]
      elsif row[21] # non-standard
        s_name = row[21]
        s_abn = row[22]
        s_acn = row[23]
        s_address = row[25]
        s_suburb = row[26]
        s_state = row[27]
        s_pc = row[28]
        s_email = row[29]
      else # legacy
        s_name = row[30]
        s_abn = ""
        s_acn = ""
        s_address = ""
        s_suburb = ""
        s_state = ""
        s_pc = row[31]
        s_email = ""
      end
      Contract.create!({
        vt_contract_number: row[1],
        vt_title: row[2],
        vt_start_date: Date.parse(row[5]),
        vt_end_date: Date.parse(row[6]),
        vt_total_value: row[4],
        vt_department_id: lookup_department_id(row[0]),
        vt_contract_type_id: lookup_contract_type(row[3]),
        vt_value_type_id: nil,
        status_index: nil,
        vt_unspc_id: row[8],
        vt_contract_description: row[9],
        vt_supplier_id: 0,
        project_id: nil,
        vt_address: nil,
        vt_status_id: lookup_contract_status(row[7]),
        vt_address_id: nil,
        vt_agency_person: row[10],
        vt_agency_phone: row[12],
        vt_agency_email: row[11],
        vt_supplier_name: s_name,
        vt_supplier_abn: s_abn,
        vt_supplier_acn: s_acn,
        vt_supplier_address: create_address(s_address, s_suburb, s_state, s_pc),
        vt_supplier_email: s_email,
        autopurge: true
      })
      # puts "Created: #{row[2]} - #{lookup_department_short_name(lookup_department_id(row[0]))}"
      count += 1
    end
    puts "Imported #{count} records"
  end

  desc "Purge Tenders Vic data from DB"
  task :purgetendersvic => :environment do
    puts "Purging Vic Tenders data"
    count = 0
    condemned = Contract.where("autopurge = true")
    condemned.each do |contract|
      # puts "Deleting: #{contract.vt_title} - #{lookup_department_short_name(contract.vt_department_id)}"
      Contract.delete(contract)
      count += 1
    end
    puts "Removed #{count} records"
  end

end
