require 'test_helper'

class CprPerformanceReportsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cpr_performance_report = cpr_performance_reports(:one)
  end

  test "should get index" do
    get cpr_performance_reports_url
    assert_response :success
  end

  test "should get new" do
    get new_cpr_performance_report_url
    assert_response :success
  end

  test "should create cpr_performance_report" do
    assert_difference('CprPerformanceReport.count') do
      post cpr_performance_reports_url, params: { cpr_performance_report: { cpr_actual_completion_date: @cpr_performance_report.cpr_actual_completion_date, cpr_actual_price: @cpr_performance_report.cpr_actual_price, cpr_adjusted_completion_date: @cpr_performance_report.cpr_adjusted_completion_date, cpr_client: @cpr_performance_report.cpr_client, cpr_comments: @cpr_performance_report.cpr_comments, cpr_contract: @cpr_performance_report.cpr_contract, cpr_contractor_acknowlages: @cpr_performance_report.cpr_contractor_acknowlages, cpr_predicted_completion_date: @cpr_performance_report.cpr_predicted_completion_date, cpr_predicted_price: @cpr_performance_report.cpr_predicted_price, cpr_price_as_varied: @cpr_performance_report.cpr_price_as_varied, cpr_principal: @cpr_performance_report.cpr_principal, cpr_report_date: @cpr_performance_report.cpr_report_date, cpr_report_reason: @cpr_performance_report.cpr_report_reason, cpr_reporting_officer: @cpr_performance_report.cpr_reporting_officer, cpr_supplier: @cpr_performance_report.cpr_supplier, cpr_total_extention_days: @cpr_performance_report.cpr_total_extention_days, cpr_validating_officer: @cpr_performance_report.cpr_validating_officer, cpr_work_percent_complete: @cpr_performance_report.cpr_work_percent_complete, score_contract_admin: @cpr_performance_report.score_contract_admin, score_coop_relations: @cpr_performance_report.score_coop_relations, score_design_contractor: @cpr_performance_report.score_design_contractor, score_environmental_management: @cpr_performance_report.score_environmental_management, score_health_and_safety: @cpr_performance_report.score_health_and_safety, score_indigenous_participation: @cpr_performance_report.score_indigenous_participation, score_industrial_relations: @cpr_performance_report.score_industrial_relations, score_personnel: @cpr_performance_report.score_personnel, score_quality_management_system: @cpr_performance_report.score_quality_management_system, score_subcontractors: @cpr_performance_report.score_subcontractors, score_time_management: @cpr_performance_report.score_time_management, score_training_management: @cpr_performance_report.score_training_management, score_work_standard: @cpr_performance_report.score_work_standard } }
    end

    assert_redirected_to cpr_performance_report_url(CprPerformanceReport.last)
  end

  test "should show cpr_performance_report" do
    get cpr_performance_report_url(@cpr_performance_report)
    assert_response :success
  end

  test "should get edit" do
    get edit_cpr_performance_report_url(@cpr_performance_report)
    assert_response :success
  end

  test "should update cpr_performance_report" do
    patch cpr_performance_report_url(@cpr_performance_report), params: { cpr_performance_report: { cpr_actual_completion_date: @cpr_performance_report.cpr_actual_completion_date, cpr_actual_price: @cpr_performance_report.cpr_actual_price, cpr_adjusted_completion_date: @cpr_performance_report.cpr_adjusted_completion_date, cpr_client: @cpr_performance_report.cpr_client, cpr_comments: @cpr_performance_report.cpr_comments, cpr_contract: @cpr_performance_report.cpr_contract, cpr_contractor_acknowlages: @cpr_performance_report.cpr_contractor_acknowlages, cpr_predicted_completion_date: @cpr_performance_report.cpr_predicted_completion_date, cpr_predicted_price: @cpr_performance_report.cpr_predicted_price, cpr_price_as_varied: @cpr_performance_report.cpr_price_as_varied, cpr_principal: @cpr_performance_report.cpr_principal, cpr_report_date: @cpr_performance_report.cpr_report_date, cpr_report_reason: @cpr_performance_report.cpr_report_reason, cpr_reporting_officer: @cpr_performance_report.cpr_reporting_officer, cpr_supplier: @cpr_performance_report.cpr_supplier, cpr_total_extention_days: @cpr_performance_report.cpr_total_extention_days, cpr_validating_officer: @cpr_performance_report.cpr_validating_officer, cpr_work_percent_complete: @cpr_performance_report.cpr_work_percent_complete, score_contract_admin: @cpr_performance_report.score_contract_admin, score_coop_relations: @cpr_performance_report.score_coop_relations, score_design_contractor: @cpr_performance_report.score_design_contractor, score_environmental_management: @cpr_performance_report.score_environmental_management, score_health_and_safety: @cpr_performance_report.score_health_and_safety, score_indigenous_participation: @cpr_performance_report.score_indigenous_participation, score_industrial_relations: @cpr_performance_report.score_industrial_relations, score_personnel: @cpr_performance_report.score_personnel, score_quality_management_system: @cpr_performance_report.score_quality_management_system, score_subcontractors: @cpr_performance_report.score_subcontractors, score_time_management: @cpr_performance_report.score_time_management, score_training_management: @cpr_performance_report.score_training_management, score_work_standard: @cpr_performance_report.score_work_standard } }
    assert_redirected_to cpr_performance_report_url(@cpr_performance_report)
  end

  test "should destroy cpr_performance_report" do
    assert_difference('CprPerformanceReport.count', -1) do
      delete cpr_performance_report_url(@cpr_performance_report)
    end

    assert_redirected_to cpr_performance_reports_url
  end
end
