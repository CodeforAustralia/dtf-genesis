require 'csv'


require "#{Rails.root}/lib/linkers/linker.rb"

namespace :scrape do
  desc "Scrape Tenders VIC for new contracts now"
  task :new => :environment do
    scrape_tenders_vic
  end

  desc "Update Tenders VIC contracts"
  task :update => :environment do
    scrape_tenders_vic true
  end
end


namespace :link do
  desc "Link VicTenders suppliers to CSR suppliers"
  task :suppliers_to_contracts => :environment do
    link_unknown_suppliers
  end
end


namespace :migrate do
  desc "Migrate data for location(or address table in csr)"
  task :location => :environment do
  end

  desc "Migrate council lists"
  task :council => :environment do
    councils = CSV.read("#{Rails.root}/db/data/council.csv")
    columns = [:codename, :name, :shortname, :type, :region_code]
    Council.import columns, councils, validate: false
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

end





















#Other Options
  # task council: :environment do
  #   batch,batch_size = [], 1_000
  #   CSV.foreach("#{Rails.root}/db/data/council.csv", :headers => true) do |row|
  #     batch << Council.new(row)
  #     if batch.size >= batch_size
  #       Council.import batch
  #       batch = []
  #     end
  #   end
  #   Council.import batch
  # end
