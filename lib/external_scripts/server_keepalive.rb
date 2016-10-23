
require "rufus-scheduler"
require 'capybara/poltergeist'

scheduler = Rufus::Scheduler.singleton

wake_job = scheduler.every '1h', :first_at => Time.parse("3:55:00 pm") do
#wake_job = scheduler.every '1d', :first_at => Time.parse("11:25:00 pm") do
    puts "Log || SCRAPER KEEPALIVE || #{Time.now.strftime("%I:%M:%S %P")}"
    Capybara.javascript_driver = :poltergeist
    session = Capybara::Session.new(:poltergeist)
    session.driver.browser.js_errors = false
    2.times do
      puts "visit"
      session.visit "http://dtf-genesis.herokuapp.com/"
      session.visit "http://cfa-dtf.herokuapp.com"
      sleep 5 * 60
    end
    session.driver.quit
end

puts "primed"
while scheduler.scheduled? wake_job
end
