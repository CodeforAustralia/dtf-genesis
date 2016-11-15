class SuppliersController < ApplicationController
  before_action :set_supplier, only: [:show, :edit, :update, :destroy]
  def index
    @suppliers = Supplier.all
  end

  def show
    @supplier = Supplier.find(params[:id])
  end

  def new
    @supplier = Supplier.new
  end

  def create
    @supplier = Supplier.create(supplier_params)
  end

  def edit
  end

  def update
    @supplier = Supplier.update_attributes(supplier_params)
  end

  def destroy
    @supplier.destroy
  end

  private
    def set_supplier
      @supplier = Supplier.find(params[:id])
    end

    def supplier_params
      params.require(:supplier).permit(:id, :name, :abn, :acn, :address, :suburb, :state, :postcode, :email)
    end
end
