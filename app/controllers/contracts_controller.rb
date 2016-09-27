class ContractsController < ApplicationController
  def index
    @contracts = Contract.all.sort_by(&:total_value)
  end

  def show
  end

  def new
    @contract = Contract.new
  end

  def create
    @contract = Contract.new(contract_params)
    if @contract.save
      redirect_to '/contracts'
    else
      redirect_to '/contracts/new'
    end
  end

  def edit
    @contract = Contract.find(contract_params[:id]) 
  end

  def update

  end


  private
    def contract_params
      params.require(:contract).permit(:title, :contract_number, :status, :start_date, :end_date, :total_value)
    end

end

