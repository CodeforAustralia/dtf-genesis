class PagesController < ApplicationController

  def home
    now = Date.today
    month_ago = now - 30
    year_ago = now - 365
    @contracts_in_30 = Contract.where("vt_start_date >= :start_date AND vt_start_date <= :end_date", {start_date: month_ago, end_date: now}).count
    @contracts_in_365 = Contract.where("vt_start_date >= :start_date AND vt_start_date <= :end_date", {start_date: year_ago, end_date: now}).count
    @value_in_30 = sum_contract_values(Contract.where("vt_start_date >= :start_date AND vt_start_date <= :end_date", {start_date: month_ago, end_date: now}))
    @value_in_365 = sum_contract_values(Contract.where("vt_start_date >= :start_date AND vt_start_date <= :end_date", {start_date: year_ago, end_date: now}))
    @department_breakdown = sum_contract_values_by_department(Contract.where("vt_start_date >= :start_date AND vt_start_date <= :end_date", {start_date: month_ago, end_date: now}))
  end

  def about
  end

  def letsencrypt
    render text: "iiyNgEQOuqL_K7XTnHg3vsG2fC5tNy-Ggaa2MlyRjaI.KPrMSemCEGMLoDSXAxxnq3xTinyladwIZkHNg7y2tM8"
  end

  def sum_contract_values_by_department(contracts)
    return [{name: "test", value: 0},{name: "test2", value: 2}]
  end

  def sum_contract_values (contracts)
    total_value = 0
    contracts.each do |contract|
      total_value += contract.vt_total_value
    end
    total_value
  end

end
