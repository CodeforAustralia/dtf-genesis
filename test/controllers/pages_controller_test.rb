require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    session = Capybara::Session.new(:poltergeist, {:js_errors => false})
    session.visit(pages_home_url)
    get pages_home_url
    assert_response :success
    Percy::Capybara.snapshot(session, name: 'home-basic')
  end

end
