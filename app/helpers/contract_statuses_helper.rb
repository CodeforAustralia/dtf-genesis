module ContractStatusesHelper

  def lookup_contract_status text
    con_status = ContractStatus.where(name: text).first
    if con_status
      con_status.id
    else
      0
    end
  end

  def lookup_contract_status_name status_id
    status_type = ContractStatus.where(id: status_id).first
    if status_type
      status_type.name
    else
      ""
    end
  end

end
