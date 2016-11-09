
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
    assert_equal 5154, lookup_department_id("CeniTex")
    assert_equal 5154, lookup_department_id("bsry^&>>808-<*7r6^%MndbrCenITexSJRrjstjrj^,86),mr")
  end

  test "department lookup should fail" do
    assert_equal 0, lookup_department_id("CenIex")
    assert_equal 0, lookup_department_id(" CenTex")
    assert_equal 0, lookup_department_id("CeITex ")
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

  test "unspsc code extraction works" do
    assert_equal 72000000, lookup_contract_unspsc("Building and Construction and Maintenance Services - (100%)")
    assert_equal 72000000, lookup_contract_unspsc("kjbsfjlbnfsBuilding and Construction and Maintenance Servicesklvsjnlav")
    assert_equal 72000000, lookup_contract_unspsc("   Building and Construction and Maintenance Services ")
    assert_equal 30000000, lookup_contract_unspsc("Structures and Building and Construction and Manufacturing Components and Supplies")
  end

  test "unspsc code extraction should fail" do
    assert_equal 0, lookup_contract_unspsc("Building and Construction and Maintenance things and Services - (100%)")
    assert_equal 0, lookup_contract_unspsc("Building")
    assert_equal 0, lookup_contract_unspsc("")
  end

  test "extract contract succeeds" do
    contract_object = extract_contract_data("Contract - HYCR037 Contract Details   Public Body: 	Department of Health and Human Services - Infrastructure Planning and Delivery Contract Number: 	HYCR037 Title: 	Royal Victorian Eye and Ear Hospital Redevelopment - Main Works Basement and Civil Works Type of Contract: 	Construction Contracts Total Value of the Contract: 	$410,000.00 (Fixed Price) Start Date: 	4 Apr, 2016 Expiry Date: 	5 Apr, 2018 Status: 	Current UNSPSC : 	Building and Construction and Maintenance Services - (100%) Description 	  Royal Victorian Eye and Ear Hospital Redevelopment (RVEEH)  Main Works Basement and Civil Works Agency Contact Details Contact Person: 	Rachel Devine Contact for factual information purposes. Explanation of contracts or interpretation of specific clauses is not provided. Contact Number: 	PHONE: (03) 90967295 Email Address: 	Rachel.Devine@dhhs.vic.gov.au Supplier Information Supplier Name: 	Ace Civil Services Pty Ltd ABN: 	16131093466 ACN: 	131093466 DUNS #: 	 Address: 	18 Brisbane Street Suburb: 	Eltham State: 	VIC Postcode: 	3095 Email Address: ", 0) # text, contract_index
    expected_response = {
      gov_entity: "Department of Health and Human Services - Infrastructure Planning and Delivery",
      gov_entity_contract_numb: "HYCR037", # 43010
      gov_entity_id_numb: 43010,
      contract_title: "Royal Victorian Eye and Ear Hospital Redevelopment - Main Works Basement and Civil Works",
      contract_type: 0,
      contract_value: 410000,
      value_type_index: ContractValueType.find_by(type_description: "Fixed Price").id,
      contract_start: Date.parse("04/04/2016"),
      contract_end: Date.parse("05/04/2018"),
      contract_status: 0,
      contract_unspsc: 72000000,
      contract_details: "Royal Victorian Eye and Ear Hospital Redevelopment (RVEEH)  Main Works Basement and Civil Works",
      vt_contract_index: "HYCR037"
    }
    assert_equal expected_response, contract_object
  end

  test "extract contract fails ..." do
    contract_object = extract_contract_data("", 0) # text, contract_index
    expected_response = {
      gov_entity: "",
      gov_entity_contract_numb: "",
      gov_entity_id_numb: 0,
      contract_title: "",
      contract_type: 0,
      contract_value: 0,
      value_type_index: 0,
      contract_start: Date.parse("11/10/1900"),
      contract_end: Date.parse("11/10/1900"),
      contract_status: 0,
      contract_unspsc: 0,
      contract_details: "",
      vt_contract_index: ""
    }
    assert_equal expected_response, contract_object
  end

#store_this_contract?   30000000, 31000000, 72000000
  test "correctly stores construction" do
    expected_to_store = {
      gov_entity: "",
      gov_entity_contract_numb: "",
      gov_entity_id_numb: 0,
      contract_title: "",
      contract_type: 0,
      contract_value: 0,
      value_type: 0,
      value_type_index: 1,
      contract_start: Date.parse("11/10/1900"),
      contract_end: Date.parse("11/10/1900"),
      contract_status: 0,
      contract_unspsc: 30000000,
      contract_details: "",
      vt_contract_index: ""
    }
    assert_equal true, store_this_contract?(expected_to_store)
  end

  test "correctly rejects non-construction" do
    expected_to_drop = {
      gov_entity: "",
      gov_entity_contract_numb: "",
      gov_entity_id_numb: 0,
      contract_title: "",
      contract_type: 0,
      contract_value: 0,
      value_type: 0,
      value_type_index: 1,
      contract_start: Date.parse("11/10/1900"),
      contract_end: Date.parse("11/10/1900"),
      contract_status: 0,
      contract_unspsc: 30000001,
      contract_details: "",
      vt_contract_index: ""
    }
    assert_equal false, store_this_contract?(expected_to_drop)
  end

end
