
def clean_name(messy_name)
  messy_name.gsub(/pty\.?/i,"").gsub(/ltd\.?/i,"").gsub(/ltd\.?/i,"Limited").gsub(/ltd\.?/i,"P/L").strip
end

def display_supplier(cause, supplier)
  puts "  :: found #{cause} match: [#{supplier.id}] #{supplier.name} (#{supplier.acn}/#{supplier.abn})"
end

def update_supplier_reference(contract)
  if contract.vt_supplier_id < 1
    this_acn = contract.vt_supplier_acn.gsub(" ","")
    this_abn = contract.vt_supplier_abn.gsub(" ","")
    simple_name = clean_name(contract.vt_supplier_name)
    acn_matches = Supplier.where(acn: this_acn)
    abn_matches = Supplier.where(abn: this_abn)
    name_matches = Supplier.where(name: simple_name)
    puts ":: Matching '#{simple_name}(#{this_abn}/#{this_acn})' acn count = #{acn_matches.count}... abn count = #{abn_matches.count}... name count = #{name_matches.count}"
    # print "."
    if acn_matches.count >= 1
      contract.vt_supplier_id = acn_matches.first.id
    elsif  abn_matches.count >= 1
      contract.vt_supplier_id = abn_matches.first.id
    elsif  name_matches.count >= 1
      contract.vt_supplier_id = name_matches.first.id
    else
      # puts "Uncertain match... acn count = #{acn_matches.count}... abn count = #{abn_matches.count}... name count = #{name_matches.count}"
    end
    contract.save
  else
    # puts "Already linked"
  end
end

def link_suppliers_to_contracts
  print "Supplier linking ["
  Contract.all.each do |contract|
    update_supplier_reference contract
  end
  print "]\n"
end

def reomove_abnacn_spaces
  Supplier.all.each do |supplier|
    supplier.abn = supplier.abn.gsub(" ","") unless supplier.abn.nil?
    supplier.acn = supplier.acn.gsub(" ","") unless supplier.acn.nil?
    supplier.save
  end
end
