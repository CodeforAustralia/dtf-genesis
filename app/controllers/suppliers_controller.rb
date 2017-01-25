class SuppliersController < ApplicationController
  before_action :set_supplier, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]
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
    @adverse_reports = @csr_performance_reports.where("csr_staff_quality < 3 OR csr_work_quality < 3 OR csr_work_quantity < 3 OR csr_coodination < 3 OR csr_administration < 3 OR csr_expr1012 < 3 OR csr_attitude_to_client < 3 OR csr_pricing < 3 OR csr_payment < 3 OR csr_ohs < 3 OR csr_ir < 3 OR csr_environment < 3 OR csr_overall < 3")
    @good_reports = @csr_performance_reports.where("csr_staff_quality > 3 OR csr_work_quality > 3 OR csr_work_quantity > 3 OR csr_coodination > 3 OR csr_administration > 3 OR csr_expr1012 > 3 OR csr_attitude_to_client > 3 OR csr_pricing > 3 OR csr_payment > 3 OR csr_ohs > 3 OR csr_ir > 3 OR csr_environment > 3 OR csr_overall > 3")
    @projects = Contract.where(vt_supplier_id: params[:id])
    @adverse_percent = if @csr_performance_reports.count == 0 then "n/a" else "%.02f%" % (@adverse_reports.count / @csr_performance_reports.count.to_f * 100) end
    @good_percent = if @csr_performance_reports.count == 0 then "n/a" else "%.02f%" % (@good_reports.count / @csr_performance_reports.count.to_f * 100) end
    @projects_valuation = 0
    @current_projects = @projects.where("vt_start_date <= :now_date AND vt_end_date >= :now_date", {now_date: Date.today})
    @current_projects.each do |project|
      @projects_valuation += project.vt_total_value
    end
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
