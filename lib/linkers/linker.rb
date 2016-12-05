
def clean_name(messy_name)
  messy_name = messy_name.gsub(/pty\.?/i,"").gsub(/ltd\.?/i,"").gsub(/limited\.?/i,"").gsub(/and\ Associates\.?/i,"").gsub(/P\/L\.?/i,"").gsub(/vic\.?/i,"").strip
  if messy_name.include?(" (")
    messy_name = messy_name[0..messy_name.index(" (")]
  end
  messy_name.downcase
end

def display_supplier(cause, supplier)
  puts "  #{cause} match: [#{supplier.id}] #{supplier.name} (#{supplier.acn}/#{supplier.abn})"
end

def update_supplier_reference(contract, print=false)
  # if contract.vt_supplier_id < 1
    this_acn = contract.vt_supplier_acn.gsub(" ","") unless contract.vt_supplier_acn.nil?
    this_abn = contract.vt_supplier_abn.gsub(" ","") unless contract.vt_supplier_abn.nil?
    simple_name = clean_name(contract.vt_supplier_name)
    acn_matches = Supplier.where(acn: this_acn)
    if this_acn.blank? then acn_matches = [] end
    abn_matches = Supplier.where(abn: this_abn)
    if this_abn.blank? then abn_matches = [] end
    name_matches = Supplier.where('LOWER( name ) LIKE ?', "%#{simple_name}%")   # .where(name: simple_name)
    if simple_name.blank? then name_matches = [] end
    if print then puts ":: Matching '#{simple_name}(#{this_abn}/#{this_acn})' acn count = #{acn_matches.count}... abn count = #{abn_matches.count}... name count = #{name_matches.count}" end
    if acn_matches.count >= 1
      contract.vt_supplier_id = acn_matches.first.id
      if print then display_supplier "ACN", acn_matches.first end
    elsif  abn_matches.count >= 1 && this_abn != ""
      contract.vt_supplier_id = abn_matches.first.id
      if print then display_supplier "ABN", abn_matches.first end
    elsif  name_matches.count >= 1
      contract.vt_supplier_id = name_matches.first.id
      if print then display_supplier "NAME", name_matches.first end
    else
      contract.vt_supplier_id = 0
      if print then puts "  :: Uncertain match... acn count = #{acn_matches.count}... abn count = #{abn_matches.count}... name count = #{name_matches.count}" end
    end
    contract.save
  # else
  #   puts "Already linked"
  # end
end

def link_suppliers_to_contracts
  # print "Supplier linking ["
  Contract.all.each do |contract|
    update_supplier_reference contract, true
  end
  # print "]\n"
end

def reomove_abnacn_spaces
  Supplier.all.each do |supplier|
    supplier.abn = supplier.abn.gsub(" ","") unless supplier.abn.nil?
    supplier.acn = supplier.acn.gsub(" ","") unless supplier.acn.nil?
    supplier.save
  end
end
