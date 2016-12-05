require 'test_helper'

class CouncilsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    @user = admin_users(:one)
    login_as @user, scope: :user
    get councils_url
    assert_response :success
  end

  test "should get show" do
    @user = admin_users(:one)
    login_as @user, scope: :user
    get councils_url
    assert_response :success
  end


end
