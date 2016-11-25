

require "#{Rails.root}/lib/linkers/linker.rb"

class PagesControllerTest < ActionDispatch::IntegrationTest

  test "matching ACN links supplier" do
    s = Supplier.create(:acn => "124578", :name => "test name")
    c = Contract.create(:vt_supplier_acn => "124578", :vt_supplier_id => 0, :vt_supplier_name => "sup name")
    update_supplier_reference(c)
    assert_equal c.vt_supplier_id, s.id
  end

  test "non matching ACN fails to link supplier" do
    s1 = Supplier.create(:abn => "24", :acn => "24578", :name => "test name")
    s2 = Supplier.create(:abn => "24", :acn => "12457", :name => "test name")
    s3 = Supplier.create(:abn => "24", :acn => "1244578", :name => "test name")
    c = Contract.create(:vt_supplier_acn => "124578", :vt_supplier_id => 0, :vt_supplier_name => "sup name")
    update_supplier_reference(c)
    assert_equal 0, c.vt_supplier_id
    assert_equal 0, c.vt_supplier_id
    assert_equal 0, c.vt_supplier_id
  end

  test "matching ABN links supplier" do
    s = Supplier.create(:abn => "124578", :name => "test name")
    c = Contract.create(:vt_supplier_abn => "124578", :vt_supplier_id => 0, :vt_supplier_name => "sup name")
    update_supplier_reference(c)
    assert_equal c.vt_supplier_id, s.id
  end

  test "non matching ABN fails to link supplier" do
    s1 = Supplier.create(:acn => "11", :abn => "24578", :name => "test name")
    s2 = Supplier.create(:acn => "11", :abn => "12457", :name => "test name")
    s3 = Supplier.create(:acn => "11", :abn => "1244578", :name => "test name")
    c = Contract.create(:vt_supplier_abn => "124578", :vt_supplier_id => 0, :vt_supplier_name => "sup name")
    update_supplier_reference(c)
    assert_equal 0, c.vt_supplier_id
    assert_equal 0, c.vt_supplier_id
    assert_equal 0, c.vt_supplier_id
  end


  test "matching name links supplier" do
    s = Supplier.create(:name => "test name")
    c = Contract.create(:vt_supplier_id => 0, :vt_supplier_name => "test name ptY. LtD")
    update_supplier_reference(c)
    assert_equal c.vt_supplier_id, s.id
  end

  test "non matching name fails to link supplier" do
    s1 = Supplier.create(:acn => "11", :abn => "2458", :name => "atest name")
    s2 = Supplier.create(:acn => "11", :abn => "2478", :name => "test namea")
    s3 = Supplier.create(:acn => "11", :abn => "2578", :name => "test_name")
    c = Contract.create(:vt_supplier_id => 0, :vt_supplier_name => "sup name")
    update_supplier_reference(c)
    assert_equal 0, c.vt_supplier_id
    assert_equal 0, c.vt_supplier_id
    assert_equal 0, c.vt_supplier_id
  end


end
