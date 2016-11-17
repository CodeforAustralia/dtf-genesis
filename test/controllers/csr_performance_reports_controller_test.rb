require 'test_helper'

class CsrPerformanceReportsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @csr_performance_report = csr_performance_reports(:one)
  end

  test "should get index" do
    get csr_performance_reports_url
    assert_response :success
  end

  test "should get new" do
    get new_csr_performance_report_url
    assert_response :success
  end

  test "should create csr_performance_report" do
    assert_difference('CsrPerformanceReport.count') do
      post csr_performance_reports_url, params: { csr_performance_report: {  } }
    end

    assert_redirected_to csr_performance_report_url(CsrPerformanceReport.last)
  end

  test "should show csr_performance_report" do
    get csr_performance_report_url(@csr_performance_report)
    assert_response :success
  end

  test "should get edit" do
    get edit_csr_performance_report_url(@csr_performance_report)
    assert_response :success
  end

  test "should update csr_performance_report" do
    patch csr_performance_report_url(@csr_performance_report), params: { csr_performance_report: {  } }
    assert_redirected_to csr_performance_report_url(@csr_performance_report)
  end

  test "should destroy csr_performance_report" do
    assert_difference('CsrPerformanceReport.count', -1) do
      delete csr_performance_report_url(@csr_performance_report)
    end

    assert_redirected_to csr_performance_reports_url
  end
end
