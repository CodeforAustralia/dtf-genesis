require 'test_helper'
require 'capybara/rails'

class PagesControllerTest < ActionDispatch::IntegrationTest

  test "should get home" do
    visit(pages_home_url)
    assert page.has_content?("Contracts awarded")
    assert page.has_content?("Value of contracts awarded")
    assert_match root_path, current_path
    assert_includes 200...300, page.status_code
  end

end
