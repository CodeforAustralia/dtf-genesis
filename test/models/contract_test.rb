require 'test_helper'

class ContractTest < ActiveSupport::TestCase

  def setup
    @contract = Contract.create(vt_contract_number: "34756",
                                vt_department_id: "CON-001",
                                vt_status_id: 0,
                                vt_title: "example title",
                                vt_start_date: Date.parse("11/10/1979"),
                                vt_end_date: Date.parse("16/10/1979"),
                                vt_total_value: 1000000 )
    # @contract = Contract.create()
  end

  test "sanity check contract" do
    assert @contract.valid?
  end

  test "internal contract number should be unique" do # even if department # is not
    @clone = @contract.dup
    @contract.vt_contract_number = "something new"
    @contract.save
    # TODO: contract # validation
  #  puts "C:#{@contract.department_index}"
  #  puts "c:#{@clone.department_index}"
  #  assert_not @clone.valid?
  end

  # test "department should not be blank" do # even if department # is not
    # TODO: add department
  # end

  test "contract_number should not be blank" do # even if department # is not
    @contract.vt_contract_number = "         "
    assert_not @contract.valid?
  end


  test "title should not be blank" do # even if department # is not
    @contract.vt_title = "         "
   assert_not @contract.valid?
  end


  test "start_date should not be nil" do # even if department # is not
    @contract.vt_start_date = nil
   assert_not @contract.valid?
  end


  test "total_value should not be nil" do # even if department # is not
    @contract.vt_total_value = nil
   assert_not @contract.valid?
  end



end
