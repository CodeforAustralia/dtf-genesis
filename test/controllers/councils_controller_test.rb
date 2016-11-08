require 'test_helper'

class CouncilsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get councils_index_url
    assert_response :success
  end

  test "should get show" do
    get councils_show_url
    assert_response :success
  end

  test "should get new" do
    get councils_new_url
    assert_response :success
  end

  test "should get create" do
    get councils_create_url
    assert_response :success
  end

  test "should get edit" do
    get councils_edit_url
    assert_response :success
  end

  test "should get update" do
    get councils_update_url
    assert_response :success
  end

end
