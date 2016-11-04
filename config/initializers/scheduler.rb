require "rufus-scheduler"
require "#{Rails.root}/lib/scrapers/scraper_utils.rb"
require "#{Rails.root}/lib/publishers/twitter.rb"
scheduler = Rufus::Scheduler.singleton

# scrape_now = scheduler.every '1h', :first_at => Time.now + 7 do #  '1h', :first_at => Time.now() + 5 do
daily_scrape = scheduler.every '1d', :first_at => Time.parse("11:55:00 pm") do #  '1h', :first_at => Time.now() + 5 do
  print "\n :: TendersVIC Scrape :: @ #{Time.now} ::"
  scrape_tenders_vic
  print "\n :: Completed Scraping ::"
end

Contract.create({
  vt_contract_number: "duns_number",
  department_index: 0,
  status: "Expired",
  title: "start today",
  start_date: Date.parse("2016-11-04"),
  end_date: Date.parse("2017-11-04"),
  total_value: 200000,
  contract_type_index: 0,
  value_type_index: 0,
  status_index: 0,
  unspc_code: 30000000,
  contract_description: "Todays job!",
  department_id: 2,
  supplier_id: 0,
  contact_id: 0,
  contract_type_id: 0,
  unspsc_id: 0,
  project_id: 0,
  address: "location",
  status_id: 0
})
Contract.create({
  vt_contract_number: "duns_number",
  department_index: 0,
  status: "Expired",
  title: "end today",
  start_date: Date.parse("2015-11-04"),
  end_date: Date.parse("2016-11-04"),
  total_value: 200000,
  contract_type_index: 0,
  value_type_index: 0,
  status_index: 0,
  unspc_code: 30000000,
  contract_description: "Todays job!",
  department_id: 2,
  supplier_id: 0,
  contact_id: 0,
  contract_type_id: 0,
  unspsc_id: 0,
  project_id: 0,
  address: "location",
  status_id: 0
})

if Time.now > Time.parse("09:00:00 am")
  start = Time.parse("09:00:00 am") + 1.days
else
  start = Time.parse("09:00:00 am")
end
#notify_now = scheduler.every '1d', :first_at => start do
notify_now = scheduler.every '1m', :first_at => Time.now + 7 do #  DEBUG
  contracts_starting_today = Contract.where(start_date: Time.now)
  contracts_starting_today.each do |contract|
    tweet_contract_start contract
  end
  contracts_ending_today = Contract.where(end_date: Time.now)
  contracts_ending_today.each do |contract|
    tweet_contract_end contract
  end
end
