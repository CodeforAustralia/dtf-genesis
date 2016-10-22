ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require "minitest/reporters"
require 'scrutinizer/ocular'
require 'simplecov'
SimpleCov.start do
  add_filter "/test/"
#  coverage_dir "log/coverage"
end
Scrutinizer::Ocular.watch! # scrutinizer coverage Setup
Minitest::Reporters.use! # minitest Setup

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Percy visual diffs
  Percy::Capybara.initialize_build
  Percy.config.default_widths = [375, 1280]
  MiniTest.after_run { Percy::Capybara.finalize_build }

end
