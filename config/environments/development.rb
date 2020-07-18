Rails.application.configure do # precedence over config/application.rb

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false
  config.eager_load = false # Do not eager load code on boot.
  config.consider_all_requests_local = true # Show full error reports.

  # Enable/disable caching. By default caching is disabled.
  if Rails.root.join('tmp/caching-dev.txt').exist?
    config.action_controller.perform_caching = true

    config.cache_store = :memory_store
    config.public_file_server.headers = {
      'Cache-Control' => 'public, max-age=172800'
    }
  else
    config.action_controller.perform_caching = false

    config.cache_store = :null_store
  end

  # config.action_mailer.delivery_method = :smtp
  # config.action_mailer.smtp_settings = {
  #  :address              => "smtp.gmail.com",
  #  :port                 => 587,
  #  :user_name            => ENV['gmail_username'],
  #  :password             => ENV['gmail_password'],
  #  :authentication       => "plain",
  #  :enable_starttls_auto => true
  # }

  config.action_mailer.perform_caching = false
  # config.action_mailer.perform_deliveries = true # SEND MAIL IN DEV
  config.action_mailer.default_url_options = { :host => 'localhost:3000' }

  config.active_support.deprecation = :log # Print deprecation notices to the Rails logger.
  config.active_record.migration_error = :page_load # Raise an error on page load if there are pending migrations.
  config.assets.debug = true # Debug mode disables concatenation and preprocessing of assets.
  config.assets.quiet = true # Suppress logger output for asset requests

end
