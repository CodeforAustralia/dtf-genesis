require "rufus-scheduler"
require "#{Rails.root}/lib/scrapers/scraper_utils.rb"
require "#{Rails.root}/lib/publishers/twitter.rb"
require "#{Rails.root}/lib/publishers/email.rb"
scheduler = Rufus::Scheduler.singleton

# scrape_now = scheduler.every '1h', :first_at => Time.now + 7 do #  '1h', :first_at => Time.now() + 5 do
daily_scrape = scheduler.every '1d', :first_at => Time.parse("11:55:00 pm") do #  '1h', :first_at => Time.now() + 5 do
  print "\n :: TendersVIC Scrape :: @ #{Time.now} ::"
  scrape_tenders_vic
  print "\n :: Completed Scraping ::"
end

if Time.now > Time.parse("09:00:00 am")
  start = Time.parse("09:00:00 am") + 1.days
else
  start = Time.parse("09:00:00 am")
end
notify_now = scheduler.every '1d', :first_at => start do
# notify_now = scheduler.every '1m', :first_at => Time.now + 7 do #  DEBUG
  contracts_starting_today = Contract.where(start_date: Time.now)
  contracts_starting_today.each do |contract|
    tweet_contract_start contract
    email_contract_start contract "puzzleduck+dtf@gmail.com"
  end
  contracts_ending_today = Contract.where(end_date: Time.now)
  contracts_ending_today.each do |contract|
    tweet_contract_end contract
  end
end
