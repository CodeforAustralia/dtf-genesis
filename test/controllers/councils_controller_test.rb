require 'test_helper'

class CouncilsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get councils_url
    assert_response :success
  end

  test "should get show" do
    get councils_url
    assert_response :success
  end

  # test "should get new" do
  #   get new_councils_url
  #   assert_response :success
  # end
  #
  # test "should get create" do
  #   get create_councils_url
  #   assert_response :success
  # end
  #
  # test "should get edit" do
  #   get edit_councils_url
  #   assert_response :success
  # end
  #
  # test "should get update" do
  #   get update_councils_url
  #   assert_response :success
  # end

end
