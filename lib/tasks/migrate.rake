require 'csv'

namespace :scrape do

  desc "Scrape Tenders VIC for new contracts now"
  task :new => :environment do
    scrape_tenders_vic
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
