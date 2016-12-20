
namespace :backup do
  desc "Backup all avaliable databases"
  task :all => :environment do
    Rake::Task["backup:contacts"].invoke
    Rake::Task["backup:statuses"].invoke
  end

  desc "Backup contacts db"
  task :contacts => :environment do
    puts "Backup #{ContactPerson.all.count} ContactPerson"
    CSV.open("#{Rails.root}/db/backup/ContactPerson.csv", "wb", force_quotes: true) do |csv|
      ContactPerson.all.each do |contact|
        csv << [contact.name, contact.phone, contact.fax, contact.email]
      end
    end
  end

  desc "Backup ContractStatus db"
  task :statuses => :environment do
    puts "Backup #{ContractStatus.all.count} ContractStatus"
    CSV.open("#{Rails.root}/db/backup/ContractStatus.csv", "wb", force_quotes: true) do |csv|
    ContractStatus.all.each do |status|
        csv << [status.name, status.short_name]
      end
    end
  end

  # desc "Backup  db"
  # task : => :environment do
  #   puts "Backup #{.all.count} "
  #   CSV.open("#{Rails.root}/db/backup/.csv", "wb", force_quotes: true) do |csv|
  #   .all.each do |status|
  #       csv << []
  #     end
  #   end
  # end

#  contract_types contract_value_types contracts councils cpr_performance_reports csr_contracts csr_performance_reports departments location_codes locations projects suppliers unspscs users


end

namespace :restore do
  desc "Restore all avaliable databases"
  task :all => :environment do
    Rake::Task["restore:contacts"].invoke
  end

  desc "Restore contacts database"
  task :contacts => :environment do
    puts "restrore contacts"
  end
end
