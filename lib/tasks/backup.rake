namespace :backup do
  desc "Backup all avaliable databases"
  task :all => :environment do
    Rake::Task["backup:contacts"].invoke
  end

  desc "Backup contacts database"
  task :contacts => :environment do
    puts "Backup contacts"
  end
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
