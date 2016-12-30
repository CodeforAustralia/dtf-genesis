
namespace :maintenance do

  desc "Remove spaces from ABNs and ACNs"
  task :remove_spaces => :environment do
    reomove_abnacn_spaces
  end

  desc "Create Ocds Ids if not present in contracts"
  task :assign_ocdsid => :environment do
    Contract.all.each do |contract|
      if contract.ocds_id.nil?
        #ocds_contract_id: "ocds-k4r8nn_agent-#{lookup_agency_id(agency)}_con-#{sanitize_contract_number(contract_id)}"
        contract.ocds_id = "ocds-k4r8nn_agent-#{contract.vt_department_id}_con-#{sanitize_contract_number(contract.vt_contract_number)}_rev-1"
        contract.save
      end
    end
  end

  desc "Print Ocds Ids and revision numbers"
  task :show_ocdsid => :environment do
    Contract.all.each do |contract|
      puts "##{contract.id} OCDS: #{contract.ocds_id} REV: #{get_revision_number(contract.ocds_id)}"
    end
  end

  desc "Remove suppliers without reports or contracts"
  task :remove_boring => :environment do
    puts "No more boring people"
    Supplier.all.each do |supplier|
#      puts "S: #{supplier.name} ... cpr: #{supplier.cpr_performance_reports.all.count} ... csr: #{supplier.csr_performance_reports.all.count}" unless (supplier.cpr_performance_reports.all.count + supplier.csr_performance_reports.all.count + supplier.contracts.all.count) == 0
      #change of tac
      projects = Contract.where(vt_supplier_id: supplier.id)
      csr_performance_reports = CsrPerformanceReport.where(csr_supplier_id: supplier.id)
      cpr_performance_reports = CprPerformanceReport.where(cpr_supplier: supplier.id)
      if (cpr_performance_reports.count + csr_performance_reports.count + projects.count) == 0
        puts "Deleting: #{supplier.name} due to lack of active information (#{cpr_performance_reports.count}/#{csr_performance_reports.count}/#{projects.count})"
        supplier.delete
      else
        puts "Saving: #{supplier.name} cpr/csr/projects: #{cpr_performance_reports.count}/#{csr_performance_reports.count}/#{projects.count}"
      end
    end
  end

  desc "Update foreign key link in csr_performance_reports"
  task :update_report_fks => :environment do
    CsrPerformanceReport.all.each do |report|
      if report.supplier_id.nil?
        puts "CsR: #{report.csr_supplier_id} ==> #{report.supplier_id}"
      #  report.supplier_id = report.csr_supplier_id
      #  report.save
      end
    end
    CprPerformanceReport.all.each do |report|
      if report.supplier_id.nil?
        puts "CpR: #{report.cpr_supplier} ==> #{report.supplier_id}"
      #  report.supplier_id = report.cpr_supplier
      #  report.save
      end
    end
  end

end
