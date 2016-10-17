require 'test_helper'

class ContractsControllerTest < ActionDispatch::IntegrationTest

  test "should get index" do
    get contracts_path
    assert_response :success
  end


end
