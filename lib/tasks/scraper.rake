
require "#{Rails.root}/lib/linkers/linker.rb"

namespace :scrape do
  desc "Scrape Tenders VIC for new contracts now"
  task :new => :environment do
    scrape_tenders_vic false, true
  end

  desc "Update Tenders VIC contracts"
  task :update => :environment do
    scrape_tenders_vic true, true
  end
end


namespace :link do
  desc "Link VicTenders suppliers to CSR suppliers"
  task :suppliers_to_contracts => :environment do
    link_suppliers_to_contracts
  end
end
