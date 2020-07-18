module ContractTypesHelper

  def lookup_contract_type_name type_id
    con_type = ContractType.where(id: type_id).first
    if con_type
      con_type.name
    else
      ""
    end
  end

  def lookup_contract_type text
    con_type = ContractType.where(name: text).first
    if con_type
      con_type.id
    else
      0
    end
  end

end
