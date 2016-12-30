module ContractsHelper

  def sanitize_contract_number text
    return text.gsub(" ","-").gsub("	","-").gsub("_","-")
  end

  def contract_updated(last_revision, contract_data)
    if last_revision.nil? || last_revision == {"ocds_id" => "ocds_contract_id-0"}
      true
    else
      if not last_revision["vt_department_id"] == contract_data[:vt_department_id]
        true
      elsif not last_revision["status_index"] == contract_data[:status_index]
        true
      elsif not last_revision["vt_title"] == contract_data[:vt_title]
        true
      elsif not last_revision["vt_start_date"] == contract_data[:vt_start_date]
        true
      elsif not last_revision["vt_end_date"] == contract_data[:vt_end_date]
        true
      elsif not last_revision["vt_total_value"] == contract_data[:vt_total_value]
        true
      elsif not last_revision["vt_contract_type_id"] == contract_data[:vt_contract_type_id]
        true
      elsif not last_revision["vt_value_type_id"] == contract_data[:vt_value_type_id]
        true
      elsif not last_revision["vt_unspc_id"] == contract_data[:vt_unspc_id]
        true
      elsif not last_revision["vt_contract_description"] == contract_data[:vt_contract_description]
        true
      elsif not last_revision["vt_agency_person"] == contract_data[:vt_agency_person]
        true
      elsif not last_revision["vt_agency_phone"] == contract_data[:vt_agency_phone]
        true
      elsif not last_revision["vt_agency_email"] == contract_data[:vt_agency_email]
        true
      elsif not last_revision["vt_supplier_name"] == contract_data[:vt_supplier_name]
        true
      elsif not last_revision["vt_supplier_abn"] == contract_data[:vt_supplier_abn]
        true
      elsif not last_revision["vt_supplier_acn"] == contract_data[:vt_supplier_acn]
        true
      elsif not last_revision["vt_supplier_address"] == contract_data[:vt_supplier_address]
        true
      elsif not last_revision["vt_supplier_email"] == contract_data[:vt_supplier_email]
        true
      elsif not last_revision["vt_supplier_id"] == contract_data[:vt_supplier_id]
        true
      elsif not last_revision["project_id"] == contract_data[:project_id]
        true
      elsif not last_revision["vt_address"] == contract_data[:vt_address]
        true
      elsif not last_revision["vt_status_id"] == contract_data[:vt_status_id]
        true
      elsif not last_revision["vt_address_id"] == contract_data[:vt_address_id]
        true
      else
        false
      end
    end
  end

  def find_partial_ocds_matches(partial_ocds_id)
    begin
      # partial_matches = Contract.select("* from data where `ocds_contract_id` LIKE '#{partial_ocds_id}%'")
      partial_matches = Contract.where("ocds_id LIKE ?", "#{partial_ocds_id}%")
    rescue
    end
    partial_matches
  end

  def get_latest_revision(matching_contracts)
    if not matching_contracts
      nil
    else
      max = {"ocds_id" => "ocds_contract_id-0"}
      matching_contracts.each do |contract|
        if contract.ocds_id.split("-").last.to_i > max["ocds_id"].split("-").last.to_i
          max = contract
        end
      end
      max
    end
  end

  def get_revision_number(ocds_contract_id)
    ocds_contract_id.split("-").last.to_i
  end

  def get_next_revision_number(contract_data)
    ocds_parts = contract_data[:ocds_id].split("_") # oc_agent_con_rev
    if ocds_parts.length == 4
      partial_ocds_id = ocds_parts[0..2].join("_")
    else
      partial_ocds_id = ocds_parts.join("_")
    end
    matching_contracts = find_partial_ocds_matches partial_ocds_id
    last_revision = get_latest_revision(matching_contracts)
    if contract_updated(last_revision, contract_data)
      if matching_contracts.nil?
        "1"
      else
        revisions = matching_contracts.count
        (revisions + 1).to_s
      end
    else
      ""
    end
  end

  def extract_contract_data text, contract_index, print=false
    gov_entity = find_between(text, "Public Body:", "Contract Number:")
    gov_entity_contract_numb = find_between(text, "Contract Number:","Title:")
    contract_title = find_between(text, "Title:","Type of Contract:")
    contract_type = find_between(text, "Type of Contract:","Total Value of the Contract:")
    value_string = find_between(text, "Total Value of the Contract:","Start Date:")
    value_type = find_between(value_string,"(",")")
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
    agency_person = find_between(text, "Contact Person:", "Contact for factual information purposes")
    agency_phone = find_between(text, "Contact Number:", "Email Address:")
    agency_email = find_between(text, "Email Address:", "Supplier Information")
    supplier_name = find_between(text, "Supplier Name:", "ABN:")
    supplier_abn = find_between(text, "ABN:", "ACN:")
    if text.include?("DUNS #:")
      supplier_acn = find_between(text, "ACN:", "DUNS #:")
    else
      supplier_acn = find_between(text, "ACN:", "Address:")
    end
    chunk = find_between(text, "Email Address:", "State:")
    street = find_between(chunk, "Address:", "Suburb:")
    suburb = find_between(text, "Suburb:", "State:")
    state = find_between(text, "State:", "Postcode:")
    post_code = find_between(text, "Postcode:", "Email Address:")
    supplier_address = "#{street}, #{suburb}, #{state} #{post_code}"
    supplier_email = find_between(text, "Email Address:", "State Government of Victoria") # or "Text size: Reduce text size Increase text size Print: Print page"
    { department_id: lookup_department_id(gov_entity, print),
      contract_number: gov_entity_contract_numb,
      contract_title: contract_title,
      contract_type: lookup_contract_type(contract_type),
      contract_value: contract_value,
      value_type_index: lookup_value_type(value_string),
      contract_start: contract_start,
      contract_end: contract_end,
      contract_status: lookup_contract_status(contract_status),
      contract_unspsc: lookup_contract_unspsc(contract_unspsc1),
      contract_details: contract_details,
      supplier_name: supplier_name,
      supplier_abn: supplier_abn,
      supplier_acn: supplier_acn,
      agency_person: agency_person,
      agency_phone: agency_phone,
      agency_email: agency_email,
      supplier_address: supplier_address,
      vt_identifier: contract_index
    }
  end

  def store_this_contract? contract_data, display=true
    unspsc_keepers = [72000000, 72131700, 72100000, 77000000, 92100000, 80000000, 30000000, 31000000, 83000000, 23000000, 22000000, 25000000, 72130000, 32000000, 92101500, 72131600, 70000000, 85000000]
    if not unspsc_keepers.include? contract_data[:contract_unspsc]
     print "🖻" if display
      false
    elsif Contract.find_by(vt_contract_number: contract_data[:contract_number])
     print "♲" if display
      false
    else
     print "🏗" if display
      true
    end
  end

  def update_this_contract contract_data
    existing_contract = Contract.find_by(vt_contract_number: contract_data[:contract_number])
    if not existing_contract.nil?
      existing_contract.vt_status_id = contract_data[:contract_status]
      existing_contract.vt_title = contract_data[:contract_title]
      existing_contract.vt_start_date = contract_data[:contract_start]
      existing_contract.vt_end_date = contract_data[:contract_end]
      existing_contract.vt_total_value = contract_data[:contract_value]
      existing_contract.vt_contract_type_id = contract_data[:contract_type]
      existing_contract.vt_value_type_id = contract_data[:value_type_index]
      existing_contract.vt_unspc_id = contract_data[:contract_unspsc]
      existing_contract.vt_contract_description = contract_data[:contract_details]
      existing_contract.vt_supplier_id = 0
      existing_contract.vt_address_id = 0
      existing_contract.vt_agency_person = contract_data[:agency_person]
      existing_contract.vt_agency_phone = contract_data[:agency_phone]
      existing_contract.vt_agency_email = contract_data[:agency_email]
      existing_contract.vt_supplier_name = contract_data[:supplier_name]
      existing_contract.vt_supplier_abn = contract_data[:supplier_abn]
      existing_contract.vt_supplier_acn = contract_data[:supplier_acn]
      existing_contract.vt_supplier_address = contract_data[:supplier_address]
      existing_contract.project_id = contract_data[:vt_identifier]
      existing_contract.save
      update_supplier_reference existing_contract
    end
  end

  def store_or_skip contract_data, refresh = false
    if refresh
      update_this_contract contract_data
    end
    if store_this_contract? contract_data
      contract = Contract.create({
        vt_contract_number: contract_data[:contract_number],
        vt_status_id: contract_data[:contract_status],
        vt_title: contract_data[:contract_title],
        vt_start_date: contract_data[:contract_start],
        vt_end_date: contract_data[:contract_end],
        vt_total_value: contract_data[:contract_value],
        vt_department_id: contract_data[:department_id],
        vt_contract_type_id: contract_data[:contract_type],
        vt_value_type_id: contract_data[:value_type_index],
        vt_unspc_id: contract_data[:contract_unspsc],
        vt_contract_description: contract_data[:contract_details],
        vt_supplier_id: 0,
        vt_address_id: 0,
        vt_agency_person: contract_data[:agency_person],
        vt_agency_phone: contract_data[:agency_phone],
        vt_agency_email: contract_data[:agency_email],
        vt_supplier_name: contract_data[:supplier_name],
        vt_supplier_abn: contract_data[:supplier_abn],
        vt_supplier_acn: contract_data[:supplier_acn],
        vt_supplier_address: contract_data[:supplier_address],
        project_id: contract_data[:vt_identifier]
      })
      update_supplier_reference contract
    end
  end

end
