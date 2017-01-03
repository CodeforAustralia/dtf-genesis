module SuppliersHelper


  def lookup_supplier_name supplier_id
    supplier = Supplier.where(id: supplier_id).first
    if supplier
      supplier.name
    else
      ""
    end
  end



end
