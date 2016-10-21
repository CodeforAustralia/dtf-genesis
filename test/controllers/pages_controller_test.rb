require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    page = get pages_home_url
    assert_response :success
    Percy::Capybara.snapshot(page, name: 'home-basic')
  end

end
