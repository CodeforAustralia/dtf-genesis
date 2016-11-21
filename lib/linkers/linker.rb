


def clean_name(messy_name)
  messy_name.gsub(/pty/i,"").gsub(/ltd/i,"").strip
end

def display_supplier(cause, supplier)
  puts "  :: found #{cause} match: [#{supplier.id}] #{supplier.name} (#{supplier.acn}/#{supplier.abn})"
end

def link_suppliers_to_contracts
  Contract.all.each do |contract|
    if contract.vt_supplier_id < 1
      this_acn = contract.vt_supplier_acn
      this_abn = contract.vt_supplier_abn
      simple_name = clean_name(contract.vt_supplier_name)
      puts "C: '#{contract.vt_title[0..50]}' ... Name: #{contract.vt_supplier_name} ==> [#{simple_name}]"
      acn_matches = Supplier.where(acn: this_acn)
      abn_matches = Supplier.where(abn: this_abn)
      name_matches = Supplier.where(name: simple_name)
      if acn_matches.count == 1
        contract.vt_supplier_id = acn_matches.first.id
        display_supplier("acn", acn_matches.first)
      elsif  abn_matches.count == 1
        contract.vt_supplier_id = abn_matches.first.id
        display_supplier("abn", abn_matches.first)
      elsif  name_matches.count == 1
        contract.vt_supplier_id = name_matches.first.id
        display_supplier("name", name_matches.first)
      else
        # puts "Uncertain match... acn count = #{acn_matches.count}... abn count = #{abn_matches.count}... name count = #{name_matches.count}"
      end
      contract.save
    else
      puts "Already linked"
    end
  end
end
