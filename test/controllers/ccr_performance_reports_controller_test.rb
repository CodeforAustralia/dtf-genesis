require 'test_helper'

class CcrPerformanceReportsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ccr_performance_report = ccr_performance_reports(:one)
  end

  test "should get index" do
    get ccr_performance_reports_url
    assert_response :success
  end

  test "should get new" do
    get new_ccr_performance_report_url
    assert_response :success
  end

  test "should create ccr_performance_report" do
    assert_difference('CcrPerformanceReport.count') do
      post ccr_performance_reports_url, params: { ccr_performance_report: { acceptance_email: @ccr_performance_report.acceptance_email, acceptance_name: @ccr_performance_report.acceptance_name, acceptance_status: @ccr_performance_report.acceptance_status, contract_id: @ccr_performance_report.contract_id, contract_location: @ccr_performance_report.contract_location, contract_type: @ccr_performance_report.contract_type, defects_liability: @ccr_performance_report.defects_liability, department_id: @ccr_performance_report.department_id, division: @ccr_performance_report.division, executive_email: @ccr_performance_report.executive_email, executive_name: @ccr_performance_report.executive_name, executive_status: @ccr_performance_report.executive_status, final_report: @ccr_performance_report.final_report, final_value: @ccr_performance_report.final_value, practical_completion: @ccr_performance_report.practical_completion, practical_completion_estimate: @ccr_performance_report.practical_completion_estimate, reporting_officer_email: @ccr_performance_report.reporting_officer_email, reporting_officer_name: @ccr_performance_report.reporting_officer_name, score_admin: @ccr_performance_report.score_admin, score_communication: @ccr_performance_report.score_communication, score_cost: @ccr_performance_report.score_cost, score_design: @ccr_performance_report.score_design, score_environment: @ccr_performance_report.score_environment, score_overall: @ccr_performance_report.score_overall, score_personnel: @ccr_performance_report.score_personnel, score_quality: @ccr_performance_report.score_quality, score_safety: @ccr_performance_report.score_safety, score_standards: @ccr_performance_report.score_standards, score_subcontract: @ccr_performance_report.score_subcontract, score_time: @ccr_performance_report.score_time, supplier_email: @ccr_performance_report.supplier_email, supplier_id: @ccr_performance_report.supplier_id, supplier_name: @ccr_performance_report.supplier_name } }
    end

    assert_redirected_to ccr_performance_report_url(CcrPerformanceReport.last)
  end

  test "should show ccr_performance_report" do
    get ccr_performance_report_url(@ccr_performance_report)
    assert_response :success
  end

  test "should get edit" do
    get edit_ccr_performance_report_url(@ccr_performance_report)
    assert_response :success
  end

  test "should update ccr_performance_report" do
    patch ccr_performance_report_url(@ccr_performance_report), params: { ccr_performance_report: { acceptance_email: @ccr_performance_report.acceptance_email, acceptance_name: @ccr_performance_report.acceptance_name, acceptance_status: @ccr_performance_report.acceptance_status, contract_id: @ccr_performance_report.contract_id, contract_location: @ccr_performance_report.contract_location, contract_type: @ccr_performance_report.contract_type, defects_liability: @ccr_performance_report.defects_liability, department_id: @ccr_performance_report.department_id, division: @ccr_performance_report.division, executive_email: @ccr_performance_report.executive_email, executive_name: @ccr_performance_report.executive_name, executive_status: @ccr_performance_report.executive_status, final_report: @ccr_performance_report.final_report, final_value: @ccr_performance_report.final_value, practical_completion: @ccr_performance_report.practical_completion, practical_completion_estimate: @ccr_performance_report.practical_completion_estimate, reporting_officer_email: @ccr_performance_report.reporting_officer_email, reporting_officer_name: @ccr_performance_report.reporting_officer_name, score_admin: @ccr_performance_report.score_admin, score_communication: @ccr_performance_report.score_communication, score_cost: @ccr_performance_report.score_cost, score_design: @ccr_performance_report.score_design, score_environment: @ccr_performance_report.score_environment, score_overall: @ccr_performance_report.score_overall, score_personnel: @ccr_performance_report.score_personnel, score_quality: @ccr_performance_report.score_quality, score_safety: @ccr_performance_report.score_safety, score_standards: @ccr_performance_report.score_standards, score_subcontract: @ccr_performance_report.score_subcontract, score_time: @ccr_performance_report.score_time, supplier_email: @ccr_performance_report.supplier_email, supplier_id: @ccr_performance_report.supplier_id, supplier_name: @ccr_performance_report.supplier_name } }
    assert_redirected_to ccr_performance_report_url(@ccr_performance_report)
  end

  test "should destroy ccr_performance_report" do
    assert_difference('CcrPerformanceReport.count', -1) do
      delete ccr_performance_report_url(@ccr_performance_report)
    end

    assert_redirected_to ccr_performance_reports_url
  end
end
