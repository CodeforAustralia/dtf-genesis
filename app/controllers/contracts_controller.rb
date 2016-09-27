class ContractsController < ApplicationController
  def index
    @contracts = Contract.all
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
      render '/contracts/new'
    end
  end

  def update
  end

  def edit
  end

  private
    def contract_params
      params.require(:contract).permit(:title, :contract_number, :status, :start_date, :end_date, :total_value)
    end

end

