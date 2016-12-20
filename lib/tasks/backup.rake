namespace :backup do
  desc "Backup contacts database"
  task :contacts => :environment do
    puts "Backup contacts"
  end

  desc "Backup other"
  task :other => :environment do
    puts "backup other"
  end
end

namespace :restore do
  desc "Restore contacts database"
  task :contacts => :environment do
    puts "restrore contacts"
  end

  desc "Restore other"
  task :other => :environment do
    puts "restore other"
  end
end
