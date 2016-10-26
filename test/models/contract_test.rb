require 'test_helper'

class ContractTest < ActiveSupport::TestCase

  def setup
    @contract = Contract.create(contract_number: "CON-001",
                                status: "testing",
                                title: "example title",
                                start_date: Date.parse("11/10/1979"),
                                end_date: Date.parse("16/10/1979"),
                                total_value: 1000000 )
    # @contract = Contract.create()
  end

  test "sanity check contract" do
    assert @contract.valid?
  end

  test "internal contract number should be unique" do # even if department # is not
    @clone = @contract.dup
    @contract.contract_number = "something new"
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
    @contract.contract_number = "         "
   assert_not @contract.valid?
  end


  test "title should not be blank" do # even if department # is not
    @contract.title = "         "
   assert_not @contract.valid?
  end


  test "start_date should not be nil" do # even if department # is not
    @contract.start_date = nil
   assert_not @contract.valid?
  end


  test "total_value should not be nil" do # even if department # is not
    @contract.total_value = nil
   assert_not @contract.valid?
  end



end
