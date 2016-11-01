require "rufus-scheduler"
require "#{Rails.root}/lib/scrapers/scraper_utils.rb"
scheduler = Rufus::Scheduler.singleton

scrape_now = scheduler.every '1h', :first_at => Time.now + 7 do #  '1h', :first_at => Time.now() + 5 do
# daily_scrape = scheduler.every '1d', :first_at => Time.parse("11:55:00 pm") do #  '1h', :first_at => Time.now() + 5 do
  print "\n :: TendersVIC Scrape :: @ #{Time.now} ::"
  scrape_tenders_vic
  print "\n :: Completed Scraping ::"
end
