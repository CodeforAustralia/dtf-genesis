class SuppliersController < ApplicationController
  before_action :set_supplier, only: [:show, :edit, :update, :destroy]
  include SmartListing::Helper::ControllerExtensions
  helper SmartListing::Helper

  def index
    supplier_scope = Supplier.all
    @supplier_options = {}
    @supplier_options = @supplier_options.merge(query: params[:filter]) if params[:filter].present?
    @supplier_options = @supplier_options.merge(filters: params[:g]) if params[:g].present?
    @@save_supplier_scope = Supplier.all_with_filter(@supplier_options, supplier_scope)
    supplier_scope = Supplier.all_with_filter(@supplier_options, supplier_scope)


    if params[:suppliers_smart_listing] && params[:suppliers_smart_listing][:page].blank?
      params[:suppliers_smart_listing][:page] = 1
    end

    @suppliers = smart_listing_create :suppliers, supplier_scope, partial: "suppliers/list", page_sizes: [10, 25, 50, 100, 250, 500]
  end

  def show
    @supplier = Supplier.find(params[:id])
    @csr_performance_reports = CsrPerformanceReport.where(csr_supplier_id: @supplier)
  end

  def new
    @supplier = Supplier.new
  end

  def edit
  end

  def create
    @supplier = Supplier.create(supplier_params)
  end


  def update
    @supplier = Supplier.update_attributes(supplier_params)
  end

  def destroy
    @supplier.destroy
  end

  def search
    render json: Supplier.where("LOWER(name) LIKE LOWER(?)", "%#{params[:k]}%")
  end

  def save
    puts "Saving: #{@@save_supplier_scope.count}"
    data = "Name,ABN,ACN,Address,Suburb,State,PostCode,Email\n"
    @@save_supplier_scope.each do |supplier|
      data += "\"#{supplier.name}\",\"#{supplier.abn}\",\"#{supplier.acn}\",\"#{supplier.address}\",\"#{supplier.suburb},\"#{supplier.state},\"#{supplier.postcode},\"#{supplier.email}\"\n"
    end
    send_data(data,
      :filename => "ccr-suppliers.csv",
      :type => "text/csv")
  end

  private
    def set_supplier
      @supplier = Supplier.find(params[:id])
    end

    def supplier_params
      params.require(:supplier).permit(:id, :name, :abn, :acn, :address, :suburb, :state, :postcode, :email)
    end
end
