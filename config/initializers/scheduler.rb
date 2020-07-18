require "rufus-scheduler"
require "#{Rails.root}/lib/scrapers/scraper_utils.rb"
require "#{Rails.root}/lib/publishers/twitter.rb"
require "#{Rails.root}/lib/publishers/email.rb"
scheduler = Rufus::Scheduler.singleton

if Time.now > Time.parse("11:55:00 am")
  start = Time.parse("11:55:00 am") + 1.days
else
  start = Time.parse("11:55:00 am")
end
daily_scrape = scheduler.every '1d', :first_at => start do #  '1h', :first_at => Time.now() + 5 do
  scrape_tenders_vic
end


if Time.now > Time.parse("09:00:00 am")
  start = Time.parse("09:00:00 am") + 1.days
else
  start = Time.parse("09:00:00 am")
end
# notify_now = scheduler.every '1m', :first_at => Time.now + 17 do #  DEBUG
notify_daily = scheduler.every '1d', :first_at => start do
  contracts_starting_today = Contract.where(vt_start_date: Time.now)
  contracts_starting_today.each do |cont|
    tweet_contract_start cont
    email_contract_start cont, "nobody@gmail.com"
  end
  contracts_ending_today = Contract.where(vt_end_date: Time.now)
  contracts_ending_today.each do |cont|
    tweet_contract_end cont
    email_contract_end cont, "nobody@gmail.com"
  end
end
