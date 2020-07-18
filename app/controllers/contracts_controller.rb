class ContractsController < ApplicationController
  before_action :set_contract, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]
  include SmartListing::Helper::ControllerExtensions
  helper  SmartListing::Helper

  def index
    scope = Contract.all
    @options = {}
    @options = @options.merge(query: params[:filter]) if params[:filter].present?
    @options = @options.merge(filters: params[:f]) if params[:f].present?
    @@saved_scope = Contract.all_with_filter(@options, scope)
    scope = Contract.all_with_filter(@options, scope)

    if params[:contracts_smart_listing] && params[:contracts_smart_listing][:page].blank?
      params[:contracts_smart_listing][:page] = 1
    end

    @contracts = smart_listing_create :contracts, scope, partial: "contracts/list", page_sizes: [10, 25, 50, 100, 250, 500]

    @csr_contracts = CsrContract.all
    
    now = Date.today
    month_ago = now - 30
    year_ago = now - 365
    @contracts_in_30 = Contract.where("vt_start_date >= :start_date AND vt_start_date <= :end_date", {start_date: month_ago, end_date: now}).count
    @contracts_in_365 = Contract.where("vt_start_date >= :start_date AND vt_start_date <= :end_date", {start_date: year_ago, end_date: now}).count
    @value_in_30 = sum_contract_values(Contract.where("vt_start_date >= :start_date AND vt_start_date <= :end_date", {start_date: month_ago, end_date: now}))
    @value_in_365 = sum_contract_values(Contract.where("vt_start_date >= :start_date AND vt_start_date <= :end_date", {start_date: year_ago, end_date: now}))
    @department_breakdown = sum_contract_values_by_department(Contract.where("vt_start_date >= :start_date AND vt_start_date <= :end_date", {start_date: year_ago, end_date: now}))
    @spending_per_month = get_spending_per_month
    @departmentspending = get_department_spending

  end

  def show
    @contract = Contract.find(params[:id])
    @csr_reports = CsrPerformanceReport.where(csr_works_no: params[:id])
    @cpr_reports = CprPerformanceReport.where(cpr_contract: params[:id])
    @ccr_reports = CcrPerformanceReport.where(contract_id: params[:id])
  end

  def new
    @contract = Contract.new
  end

  def edit
  end

  def create
    @contract = Contract.create(contract_params)
  end

  def update
    @contract.update_attributes(contract_params)
  end

  def destroy
    @contract.destroy
  end

  def search
    render json: Contract.where("LOWER(vt_title) LIKE LOWER(?)", "%#{params[:q]}%")
  end

  def save
    puts "Saving: #{@@saved_scope.count}"
    data = "Title,Reference,Value,Start,End,Status,DepartmentId,Description,SupplierName,AgencyContact\n"
    @@saved_scope.each do |contract|
      data += "\"#{contract.vt_title}\",\"#{contract.vt_contract_number}\",\"#{contract.vt_total_value}\",\"#{contract.vt_start_date}\",\"#{contract.vt_end_date}\",\"#{contract.vt_status_id}\",\"#{contract.vt_department_id}\",\"#{contract.vt_contract_description}\",\"#{contract.vt_supplier_name}\",\"#{contract.vt_agency_person}\"\n"
    end
    send_data(data,
      :filename => "ccr-results.csv",
      :type => "text/csv")
  end

  def sum_contract_values (contracts)
    total_value = 0
    contracts.each do |contract|
      total_value += contract.vt_total_value
    end
    total_value
  end

  def sum_contract_values_by_department(contracts)
    department_totals = []
    contracts.each do |contract|
      dep_match = department_totals.find_all{|dep| dep[:name] == DepartmentHelper::lookup_department_short_name(contract.vt_department_id)}
      if dep_match && dep_match.length > 0
        dep_match = {name: DepartmentHelper::lookup_department_short_name(contract.vt_department_id), value: dep_match.first[:value] + contract.vt_total_value}
      else
        department_totals.append({name: DepartmentHelper::lookup_department_short_name(contract.vt_department_id), value: contract.vt_total_value})
      end
    end
    department_totals
  end

  def get_department_spending
    agency_groups = Contract.group(:vt_department_id)
    summary = []
    agency_groups.count.each do |agency|
      summary.append({name: lookup_department_name(agency[0]), value: agency[1]})
    end
    summary
  end
  
  def get_spending_per_month
    breakdown = []
    period_end = Date.today
    12.times do |x|
      month_before = period_end - 30
      monthly_contracts = Contract.where("vt_start_date >= :start_date AND vt_start_date <= :end_date", {start_date: month_before, end_date: period_end})
      total_value = sum_contract_values(monthly_contracts)
      breakdown[x] = {name: Date::MONTHNAMES[month_before.month], value: total_value}
      period_end = period_end - 30
    end
    breakdown.reverse!
  end

  private
    def set_contract
      @contract = Contract.find(params[:id])
    end

    def contract_params
      params.require(:contract).permit(:vt_title, :vt_contract_number, :vt_total_value, :vt_start_date, :vt_end_date, :vt_status_id )
    end
end
