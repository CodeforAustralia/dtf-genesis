
require "#{Rails.root}/lib/scrapers/scraper_utils.rb"

class PagesControllerTest < ActionDispatch::IntegrationTest

  test "find_between finds text" do
    assert_match "between", find_between("pre between post", "pre ", " post")
  end

  test "find_between fails if no post-text" do
    assert_match "", find_between("pre betwe", "pre ", " post")
  end

  test "find_between fails if no pre-text" do
    assert_match "", find_between("tween post", "pre ", " post")
  end

  test "department lookup should succeed" do
    assert_equal 5154, lookup_department_id("CenITex")
    assert_equal 5154, lookup_department_id(" CenITex")
    assert_equal 5154, lookup_department_id("CenITex ")
    assert_equal 5154, lookup_department_id("CenITex (452)")
    assert_equal 5154, lookup_department_id("bsry^&>>808-<*7r6^%MndbrCenITexSJRrjstjrj^,86),mr")
  end

  test "department lookup should fail" do
    assert_equal 0, lookup_department_id("CenIex")
    assert_equal 0, lookup_department_id(" CenTex")
    assert_equal 0, lookup_department_id("CeITex ")
    assert_equal 0, lookup_department_id("CeniTex")
    assert_equal 0, lookup_department_id("")
  end

  test "unspsc lookup for construction succeeds" do
    assert_equal 30000000, lookup_contract_unspsc("Structures and Building and Construction and Manufacturing Components and Supplies")
    assert_equal 30000000, lookup_contract_unspsc("Structures and Building and Construction and Manufacturing Components and Supplies (100%)")
    assert_equal 30000000, lookup_contract_unspsc("Structures and Building and Construction and Manufacturing Components and Supplies (50%)")
    assert_equal 30000000, lookup_contract_unspsc("Structures and Building and Construction and Manufacturing Components and Suppliesjnelw938u4vpm9u,v4tcqp3t;a")
    assert_equal 72000000, lookup_contract_unspsc("Building and Construction and Maintenance Services")
  end

  test "other unspsc lookups fail" do
    assert_equal 0, lookup_contract_unspsc("not unspsc")
    assert_equal 0, lookup_contract_unspsc("Building and Construction")
    assert_equal 0, lookup_contract_unspsc("")
  end

end
