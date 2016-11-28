require 'test_helper'

class ContractStatusesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @contract_status = contract_statuses(:one)
  end

  test "should get index" do
    get contract_statuses_url
    assert_response :success
  end

  test "should get new" do
    get new_contract_status_url
    assert_response :success
  end

  test "should create contract_status" do
    assert_difference('ContractStatus.count') do
      post contract_statuses_url, params: { contract_status: { name: @contract_status.name, short_name: @contract_status.short_name } }
    end

    assert_redirected_to contract_status_url(ContractStatus.last)
  end

  test "should show contract_status" do
    get contract_status_url(@contract_status)
    assert_response :success
  end

  test "should get edit" do
    get edit_contract_status_url(@contract_status)
    assert_response :success
  end

  test "should update contract_status" do
    patch contract_status_url(@contract_status), params: { contract_status: { name: @contract_status.name, short_name: @contract_status.short_name } }
    assert_redirected_to contract_status_url(@contract_status)
  end

  test "should destroy contract_status" do
    assert_difference('ContractStatus.count', -1) do
      delete contract_status_url(@contract_status)
    end

    assert_redirected_to contract_statuses_url
  end
end
