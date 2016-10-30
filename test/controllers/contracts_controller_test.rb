require 'test_helper'

class ContractsControllerTest < ActionDispatch::IntegrationTest

  test "should get contract list" do
    get contracts_path
    assert_response :success
  end


end
