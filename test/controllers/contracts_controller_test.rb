require 'test_helper'

class ContractsControllerTest < ActionDispatch::IntegrationTest

  test "should get contract list" do
    @user = admin_users(:one)
    login_as @user, scope: :user
    get contracts_path
    assert_response :success
  end

  test "non logged in user should get redirected" do
    get contracts_path
    assert_redirected_to new_user_session_path
  end


end
