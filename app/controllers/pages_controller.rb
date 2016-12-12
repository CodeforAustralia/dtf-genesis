class PagesController < ApplicationController

  def home
    now = Date.today
    month_ago = now - 30
    year_ago = now - 365
    @contracts_in_30 = Contract.where("vt_start_date >= :start_date AND vt_start_date <= :end_date", {start_date: month_ago, end_date: now}).count
    @contracts_in_365 = Contract.where("vt_start_date >= :start_date AND vt_start_date <= :end_date", {start_date: year_ago, end_date: now}).count
    @value_in_30 = sum_contract_values(Contract.where("vt_start_date >= :start_date AND vt_start_date <= :end_date", {start_date: month_ago, end_date: now}))
    @value_in_365 = sum_contract_values(Contract.where("vt_start_date >= :start_date AND vt_start_date <= :end_date", {start_date: year_ago, end_date: now}))
    @department_breakdown = sum_contract_values_by_department(Contract.where("vt_start_date >= :start_date AND vt_start_date <= :end_date", {start_date: year_ago, end_date: now}))
    @spending_per_month = get_spending_per_month
  end

  def about
  end

  def letsencrypt
    render text: "iiyNgEQOuqL_K7XTnHg3vsG2fC5tNy-Ggaa2MlyRjaI.KPrMSemCEGMLoDSXAxxnq3xTinyladwIZkHNg7y2tM8"
  end

  def get_spending_per_month
    breakdown = []
    period_end = Date.today
    12.times do |x|
      month_before = period_end - 30
      monthly_contracts = Contract.where("vt_start_date >= :start_date AND vt_start_date <= :end_date", {start_date: month_before, end_date: period_end})
      total_value = sum_contract_values(monthly_contracts)
      puts "X-#{x}: #{Date::MONTHNAMES[month_before.month]} ~~> #{period_end.month} has #{monthly_contracts.count} at #{total_value}"
      breakdown[x] = {name: Date::MONTHNAMES[month_before.month], value: total_value}
      period_end = period_end - 30
    end
    breakdown.reverse!
  end

  def sum_contract_values_by_department(contracts)
    department_totals = []
    contracts.each do |contract|
      dep_match = department_totals.find_all{|dep| dep[:id] == contract.vt_department_id}
      if dep_match && dep_match.length > 0
        dep_match = {id: contract.vt_department_id, name: lookup_department_name(contract.vt_department_id), value: dep_match.first[:value] + contract.vt_total_value}
      else
        department_totals.append({id: contract.vt_department_id, name: lookup_department_name(contract.vt_department_id), value: contract.vt_total_value})
      end
    end
    department_totals
  end

  def sum_contract_values (contracts)
    total_value = 0
    contracts.each do |contract|
      total_value += contract.vt_total_value
    end
    total_value
  end

end
