require 'test_helper'

class ContractTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @contract_type = contract_types(:one)
    @user = admin_users(:one)
    login_as @user, scope: :user
  end

  test "should get index" do
    get contract_types_url
    assert_response :success
  end

  test "should get new" do
    get new_contract_type_url
    assert_response :success
  end

  test "should create contract_type" do
    assert_difference('ContractType.count') do
      post contract_types_url, params: { contract_type: { name: @contract_type.name, short_name: @contract_type.short_name } }
    end

    assert_redirected_to contract_type_url(ContractType.last)
  end

  test "should show contract_type" do
    get contract_type_url(@contract_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_contract_type_url(@contract_type)
    assert_response :success
  end

  test "should update contract_type" do
    patch contract_type_url(@contract_type), params: { contract_type: { name: @contract_type.name, short_name: @contract_type.short_name } }
    assert_redirected_to contract_type_url(@contract_type)
  end

  test "should destroy contract_type" do
    assert_difference('ContractType.count', -1) do
      delete contract_type_url(@contract_type)
    end

    assert_redirected_to contract_types_url
  end
end
