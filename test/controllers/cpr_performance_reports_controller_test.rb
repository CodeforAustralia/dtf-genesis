require 'test_helper'

class CprPerformanceReportsControllerTest < ActionDispatch::IntegrationTest

  setup do
    @cpr_performance_report = cpr_performance_reports(:one)
  end

  test "should get index" do
    @user = admin_users(:one)
    login_as @user, scope: :user
    get cpr_performance_reports_url
    assert_response :success
  end

  test "should show cpr_performance_report" do
    @user = admin_users(:one) # create(:one)
    login_as @user, scope: :user
    get cpr_performance_report_url(@cpr_performance_report)
    assert_response :success
  end

end
