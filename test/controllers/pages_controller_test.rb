require 'test_helper'
require 'capybara/rails'

class PagesControllerTest < ActionDispatch::IntegrationTest

  test "should get home" do
    visit(pages_home_url)
    screenshot_and_save_page

    assert page.has_content?("find out what Victoria is building")
    assert_match root_path, current_path
    assert_includes 200...300, page.status_code
  end

end
