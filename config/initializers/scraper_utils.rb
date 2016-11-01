

def find_between(text, pre_string, post_string)
  matches = text.match(/#{pre_string}(.*?)#{post_string}/)
  if matches && matches.length > 1
    matches[1].strip
  else
    puts "Match failed!"
    puts "nothing between '#{pre_string}' & '#{post_string}'"
    puts "in #{text}"
    ""
  end
end

def lookup_department_id(department_text)
  if department_text.include?("CenITex")
    5154
  elsif department_text.include?("Department of Economic Development, Jobs, Transport and Resources")
    43087
  elsif department_text.include?("Department of Education and Training")
    42999
  elsif department_text.include?("Department of Environment and Primary Industries")
    43
  elsif department_text.include?("Department of Environment, Land, Water and Planning")
    42924
  elsif department_text.include?("Department of Health & Human Services (DHHS)")
    42963
  elsif department_text.include?("Department of Health and Human Services - Infrastructure Planning and Delivery")
    43010
  elsif department_text.include?("Department of Justice & Regulation")
    43004
  elsif department_text.include?("Department of Premier and Cabinet")
    10
  elsif department_text.include?("Independent Broad-based Anti-corruption Commission")
    42425
  elsif department_text.include?("Infrastructure Victoria")
    52488
  elsif department_text.include?("Major Projects Victoria")
    20135
  elsif department_text.include?("Metropolitan Fire and Emergency Services Board")
    3161
  elsif department_text.include?("State Revenue Office")
    15
  elsif department_text.include?("Victoria Police")
    39
  elsif department_text.include?("Victorian Auditor General's Office")
    5979
  elsif department_text.include?("Victorian Commission for Gambling and Liquor Regulation")
    33602
  elsif department_text.include?("Whole of Victorian Government")
    18641
  elsif department_text.include?("WoVG Land Sales")
    18669
  end
end

def lookup_contract_type(text)
  0
end

def lookup_value_type(text)
  0
end

def lookup_contract_status(text)
  0
end

def lookup_contract_unspsc(text)
  if text.include?("Structures and Building and Construction and Manufacturing Components and Supplies")
    30000000
  elsif text.include?("Building and Construction and Maintenance Services") #72100000
    72000000
  else
    0
  end
end

def extract_contract_data(text, contract_index)
  gov_entity = find_between(text, "Public Body:", "Contract Number:")
  gov_entity_contract_numb = find_between(text, "Contract Number:","Title:")
  contract_title = find_between(text, "Title:","Type of Contract:")
  contract_type = find_between(text, "Type of Contract:","Total Value of the Contract:")
  value_string = find_between(text, "Total Value of the Contract:","Start Date:")
  contract_value = (value_string.gsub(",","").gsub("$","").to_f).to_i
  begin
    contract_start = Date.parse(find_between(text, "Start Date:","Expiry Date:"))
  rescue
    contract_start = Date.parse("11/10/1900")
  end
  begin
    contract_end = Date.parse(find_between(text, "Expiry Date:","Status:"))
  rescue
    contract_end = Date.parse("11/10/1900")
  end
  contract_status = find_between(text, "Status:", "UNSPSC :")
  begin
    contract_unspsc1 = find_between(text, "UNSPSC :", "Description")
  rescue
    contract_unspsc1 = find_between(text, "UNSPSC 1:", "Description")
    contract_unspsc2 = find_between(text, "UNSPSC 2:", "Description")
  end
  contract_details = find_between(text, "Description", "Agency Contact Details")
  { gov_entity: gov_entity,
    gov_entity_contract_numb: gov_entity_contract_numb, # should be contract_index
    gov_entity_id_numb: lookup_department_id(gov_entity),
    contract_title: contract_title,
    contract_type: lookup_contract_type(contract_type),
    contract_value: contract_value,
    value_type: lookup_value_type(value_string),
    contract_start: contract_start,
    contract_end: contract_end,
    contract_status: lookup_contract_status(contract_status),
    contract_unspsc: lookup_contract_unspsc(contract_unspsc1),
    contract_details: contract_details,
    vt_contract_index: gov_entity_contract_numb # should be contract_index: ex vt_contract_number
  }
end

def store_or_skip(contract_data)
  unspsc_include = [
    30000000,
    31000000,
    72000000
  ]
  if not unspsc_include.include?(contract_data[:contract_unspsc])
    print "."
  elsif Contract.find_by(department_index: contract_data[:gov_entity_contract_numb])
    print "."
  else
    # Contract.create!(contract_number: contract_data[:gov_entity_contract_numb],
    #                  status: contract_data[:contract_status],
    #                  title: contract_data[:contract_title],
    #                  start_date: contract_data[:contract_start],
    #                  end_date: contract_data[:contract_end],
    #                  total_value: contract_data[:contract_value] )
    print "*"
    Contract.create({
#      vt_contract_number: contract_data[:gov_entity_contract_numb], #todo fix this sh#t
      # department_index: contract_data[:gov_entity_contract_numb],
      status: contract_data[:contract_status],
      title: contract_data[:contract_title],
      start_date: contract_data[:contract_start],
      end_date: contract_data[:contract_end],
      total_value: contract_data[:contract_value],
      department_index: contract_data[:gov_entity_id_numb],
      contract_type_index: contract_data[:contract_type],
      value_type_index: contract_data[:value_type],
      status_index: contract_data[:contract_status],
      unspc_code: contract_data[:contract_unspsc],
      contract_description: contract_data[:contract_details],
      department_id: Faker::Number.between(0, 19),
      supplier_id: 0,
      contact_id: 0,
      address: "",
      vt_contract_number: contract_data[:gov_entity_contract_numb]
      })
  end
end
