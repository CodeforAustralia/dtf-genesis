class ContractsController < ApplicationController
  before_action :set_contract, only: [:show, :edit, :update, :destroy]
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
  end

  def show
    @contract = Contract.find(params[:id])
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

  private
    def set_contract
      @contract = Contract.find(params[:id])
    end

    def contract_params
      params.require(:contract).permit(:vt_title, :vt_contract_number, :vt_total_value, :vt_start_date, :vt_end_date, :vt_status_id )
    end
end
