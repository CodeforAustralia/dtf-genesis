
require "rufus-scheduler"
require 'capybara/poltergeist'

scheduler = Rufus::Scheduler.singleton
wake_job = scheduler.every '1d', :first_at => Time.parse("11:25:00 pm") do
    puts "Log || SCRAPER KEEPALIVE || #{Time.now.strftime("%I:%M:%S %P")}"
    Capybara.javascript_driver = :poltergeist
    session = Capybara::Session.new(:poltergeist)
    session.driver.browser.js_errors = false
    6.times do
      session.visit "http://dtf-genesis.herokuapp.com/"
      sleep 5 * 60
    end
    session.driver.quit
end

while scheduler.scheduled? wake_job
end
