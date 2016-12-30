
namespace :maintenance do

  desc "Remove spaces from ABNs and ACNs"
  task :remove_spaces => :environment do
    reomove_abnacn_spaces
  end

  desc "Remove suppliers without reports or contracts"
  task :remove_boring => :environment do
    puts "No more boring people"
  end



end
