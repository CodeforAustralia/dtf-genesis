require 'test_helper'

class CprScoresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cpr_score = cpr_scores(:one)
  end

  test "should get index" do
    get cpr_scores_url
    assert_response :success
  end

  test "should get new" do
    get new_cpr_score_url
    assert_response :success
  end

  test "should create cpr_score" do
    assert_difference('CprScore.count') do
      post cpr_scores_url, params: { cpr_score: { contract_admin: @cpr_score.contract_admin, coop_relations: @cpr_score.coop_relations, cpr_report_id: @cpr_score.cpr_report_id, design_contractor: @cpr_score.design_contractor, environmental_management: @cpr_score.environmental_management, health_and_safety: @cpr_score.health_and_safety, indigenous_participation: @cpr_score.indigenous_participation, industrial_relations: @cpr_score.industrial_relations, personnel: @cpr_score.personnel, quality_management_system: @cpr_score.quality_management_system, subcontractors: @cpr_score.subcontractors, time_management: @cpr_score.time_management, training_management: @cpr_score.training_management, work_standard: @cpr_score.work_standard } }
    end

    assert_redirected_to cpr_score_url(CprScore.last)
  end

  test "should show cpr_score" do
    get cpr_score_url(@cpr_score)
    assert_response :success
  end

  test "should get edit" do
    get edit_cpr_score_url(@cpr_score)
    assert_response :success
  end

  test "should update cpr_score" do
    patch cpr_score_url(@cpr_score), params: { cpr_score: { contract_admin: @cpr_score.contract_admin, coop_relations: @cpr_score.coop_relations, cpr_report_id: @cpr_score.cpr_report_id, design_contractor: @cpr_score.design_contractor, environmental_management: @cpr_score.environmental_management, health_and_safety: @cpr_score.health_and_safety, indigenous_participation: @cpr_score.indigenous_participation, industrial_relations: @cpr_score.industrial_relations, personnel: @cpr_score.personnel, quality_management_system: @cpr_score.quality_management_system, subcontractors: @cpr_score.subcontractors, time_management: @cpr_score.time_management, training_management: @cpr_score.training_management, work_standard: @cpr_score.work_standard } }
    assert_redirected_to cpr_score_url(@cpr_score)
  end

  test "should destroy cpr_score" do
    assert_difference('CprScore.count', -1) do
      delete cpr_score_url(@cpr_score)
    end

    assert_redirected_to cpr_scores_url
  end
end
