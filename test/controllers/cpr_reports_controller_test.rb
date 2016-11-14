require 'test_helper'

class CprReportsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cpr_report = cpr_reports(:one)
  end

  test "should get index" do
    get cpr_reports_url
    assert_response :success
  end

  test "should get new" do
    get new_cpr_report_url
    assert_response :success
  end

  test "should create cpr_report" do
    assert_difference('CprReport.count') do
      post cpr_reports_url, params: { cpr_report: { cpr_actual_completion_date: @cpr_report.cpr_actual_completion_date, cpr_actual_price: @cpr_report.cpr_actual_price, cpr_adjusted_completion_date: @cpr_report.cpr_adjusted_completion_date, cpr_client: @cpr_report.cpr_client, cpr_comments: @cpr_report.cpr_comments, cpr_contract: @cpr_report.cpr_contract, cpr_contractor: @cpr_report.cpr_contractor, cpr_contractor_acknowlages: @cpr_report.cpr_contractor_acknowlages, cpr_predicted_completion_date: @cpr_report.cpr_predicted_completion_date, cpr_predicted_price: @cpr_report.cpr_predicted_price, cpr_price_as_varied: @cpr_report.cpr_price_as_varied, cpr_principal: @cpr_report.cpr_principal, cpr_report_date: @cpr_report.cpr_report_date, cpr_report_reason: @cpr_report.cpr_report_reason, cpr_reporting_officer: @cpr_report.cpr_reporting_officer, cpr_total_extention_days: @cpr_report.cpr_total_extention_days, cpr_validating_officer: @cpr_report.cpr_validating_officer, cpr_work_percent_complete: @cpr_report.cpr_work_percent_complete } }
    end

    assert_redirected_to cpr_report_url(CprReport.last)
  end

  test "should show cpr_report" do
    get cpr_report_url(@cpr_report)
    assert_response :success
  end

  test "should get edit" do
    get edit_cpr_report_url(@cpr_report)
    assert_response :success
  end

  test "should update cpr_report" do
    patch cpr_report_url(@cpr_report), params: { cpr_report: { cpr_actual_completion_date: @cpr_report.cpr_actual_completion_date, cpr_actual_price: @cpr_report.cpr_actual_price, cpr_adjusted_completion_date: @cpr_report.cpr_adjusted_completion_date, cpr_client: @cpr_report.cpr_client, cpr_comments: @cpr_report.cpr_comments, cpr_contract: @cpr_report.cpr_contract, cpr_contractor: @cpr_report.cpr_contractor, cpr_contractor_acknowlages: @cpr_report.cpr_contractor_acknowlages, cpr_predicted_completion_date: @cpr_report.cpr_predicted_completion_date, cpr_predicted_price: @cpr_report.cpr_predicted_price, cpr_price_as_varied: @cpr_report.cpr_price_as_varied, cpr_principal: @cpr_report.cpr_principal, cpr_report_date: @cpr_report.cpr_report_date, cpr_report_reason: @cpr_report.cpr_report_reason, cpr_reporting_officer: @cpr_report.cpr_reporting_officer, cpr_total_extention_days: @cpr_report.cpr_total_extention_days, cpr_validating_officer: @cpr_report.cpr_validating_officer, cpr_work_percent_complete: @cpr_report.cpr_work_percent_complete } }
    assert_redirected_to cpr_report_url(@cpr_report)
  end

  test "should destroy cpr_report" do
    assert_difference('CprReport.count', -1) do
      delete cpr_report_url(@cpr_report)
    end

    assert_redirected_to cpr_reports_url
  end
end
