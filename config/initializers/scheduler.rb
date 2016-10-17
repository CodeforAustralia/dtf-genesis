require "rufus-scheduler"
scheduler = Rufus::Scheduler.singleton

fast_job = scheduler.every '5m' do
    Rails.logger.info "Log || TIME || #{Time.now.strftime("%I:%M:%S %P")}"
end
