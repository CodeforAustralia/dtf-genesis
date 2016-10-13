class ContractsController < ApplicationController
  before_action :set_contract, only: [:show, :edit, :update, :destroy]
  include SmartListing::Helper::ControllerExtensions
  helper  SmartListing::Helper

  def index
    scope = Contract.all
    options = {}
    options = options.merge(query: params[:filter]) if params[:filter].present?
    options = options.merge(filters: params[:f]) if params[:f].present?
    scope = Contract.all_with_filter(options, scope)

    if params[:contracts_smart_listing] && params[:contracts_smart_listing][:page].blank?
      params[:contracts_smart_listing][:page] = 1
    end

    @contracts = smart_listing_create :contracts, scope, partial: "contracts/list", page_sizes: [10, 25, 50, 100, 250, 500]
  end

  def show
    respond_to do |format|
      format.json { render json: @contract }
    end
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
    render json: Contract.where("LOWER(title) LIKE LOWER(?)", "%#{params[:q]}%")
  end

  private
    def set_contract
      @contract = Contract.find(params[:id])
    end

    def contract_params
      params.require(:contract).permit(:title, :contract_number, :total_value, :start_date, :end_date, :status )
    end
end
