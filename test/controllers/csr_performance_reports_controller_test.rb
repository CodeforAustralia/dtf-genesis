require 'test_helper'

class CsrPerformanceReportsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @csr_performance_report = csr_performance_reports(:one)
  end

  test "should get index" do
    @user = admin_users(:one)
    login_as @user, scope: :user
    get csr_performance_reports_url
    assert_response :success
  end

  test "should show csr_performance_report" do
    @user = admin_users(:one)
    login_as @user, scope: :user
    get csr_performance_report_url(@csr_performance_report)
    assert_response :success
  end

end
