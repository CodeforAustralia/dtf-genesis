class CsrContractsController < ApplicationController
  before_action :set_contract, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]
  include SmartListing::Helper::ControllerExtensions
  helper SmartListing::Helper

  def index
    scope = CsrContract.all
    options = {}
    options = options.merge(query: params[:filter]) if params[:filter].present?
    options = options.merge(filters: params[:f]) if params[:f].present?
    @@saved_csr_contract_scope = CsrContract.all_with_filter(options, scope)
    scope = CsrContract.all_with_filter(options, scope)

    if params[:csr_contracts_smart_listing] && params[:csr_contracts_smart_listing][:page].blank?
      params[:csr_contracts_smart_listing][:page] = 1
    end 

    @csr_contracts = smart_listing_create :csr_contracts, scope, partial: "csr_contracts/list", page_sizes: [10, 25, 50, 100, 250, 500]
    @contracts = Contract.all
  end

  def show
    @csr_contract = CsrContract.find(params[:id])
  end

  def new
    @csr_contract = CsrContract.new
  end

  def edit
  end

  def create
    @csr_contract = CsrContract.create(csr_contract_params)
  end

  def update
    @csr_contract.update_attributes(csr_contract_params)
  end

  def destroy
    @csr_contract.destroy
  end

  def search
    render json: CsrContract.where("LOWER(csr_description) LIKE LOWER(?)", "%#{params[:p]}%")
  end

  def save
    puts "Saving: #{@@saved_csr_contract_scope.count}"
    data = "Description,Location,Category,Value,Client,Start,Completion,Comment\n"
    @@saved_csr_contract_scope.each do |supplier|
      data += "\"#{csr_description}\",\"#{csr_location}\",\"#{csr_category}\",\"#{csr_value}\",\"#{csr_client},\"#{csr_start_date},\"#{csr_finish_date},\"#{csr_comment}\"\n"
    end
    send_data(data,
      :filename => "csr-contracts.csv",
      :type => "text/csv")
  end

  private

    def set_contract
      @csr_contract = CsrContract.find(params[:id])
    end

    def csr_contract_params
      params.require(:csr_contract).permit(:csr_works_no, :csr_supplier_id, :csr_supplier_type, :csr_description, :csr_location, :csr_category, :csr_value, :csr_client, :csr_start_date, :csr_finish_date, :csr_comment, :csr_source)
    end

end
