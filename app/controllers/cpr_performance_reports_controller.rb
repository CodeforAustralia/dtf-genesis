class CprPerformanceReportsController < ApplicationController
  before_action :set_cpr_performance_report, only: [:show, :edit, :update, :destroy]

  # GET /cpr_performance_reports
  # GET /cpr_performance_reports.json
  def index
    @cpr_performance_reports = CprPerformanceReport.all
  end

  # GET /cpr_performance_reports/1
  # GET /cpr_performance_reports/1.json
  def show
    redirect_to :id => params[:id], :controller => :cpr_performance_reports, :action => 'edit', :contract_id => params[:contract_id], :supplier_id => params[:supplier_id], :supplier_name => params[:supplier_name], :department => params[:department], :reason => params[:reason]
  end

  # GET /cpr_performance_reports/new
  def new
    @cpr_performance_report = CprPerformanceReport.new
    puts " ::: NEW ::: contract_id: #{params[:contract_id]}"
    if params[:contract_id] && params[:contract_id] != 0
      @contract = Contract.find(params[:contract_id])
    end
    if params[:supplier_id] && params[:supplier_id] != "0"
      @supplier = Supplier.find(params[:supplier_id])
    end
    if params[:department] && params[:department] != "0"
      @department = Department.where(:vt_number => params[:department]).first
    end
    if params[:supplier_name]
      @supplier_name = params[:supplier_name]
    end
    if params[:reason]
      @reason = params[:reason]
    end
  end

  # GET /cpr_performance_reports/1/edit
  def edit
    @cpr_performance_report = CprPerformanceReport.find(params[:id])
    puts " ::: EDIT ::: id: #{params[:id]}"
    puts " ::: EDIT ::: contract_id: #{params[:contract_id]}"
    if params[:contract_id] && params[:contract_id] != 0
      @contract = Contract.find(params[:contract_id])
    end
    if params[:supplier_id] && params[:supplier_id] != "0"
      @supplier = Supplier.find(params[:supplier_id])
    end
    if params[:department] && params[:department] != "0"
      @department = Department.where(:vt_number => params[:department]).first
    end
    if params[:supplier_name]
      @supplier_name = params[:supplier_name]
    end
    if params[:reason]
      @reason = params[:reason]
    end
  end

  # POST /cpr_performance_reports
  # POST /cpr_performance_reports.json
  def create
    @cpr_performance_report = CprPerformanceReport.new(cpr_performance_report_params)

    respond_to do |format|
      if @cpr_performance_report.save
        format.html { redirect_to @cpr_performance_report, notice: 'Cpr performance report was successfully created.' }
        format.json { render :show, status: :created, location: @cpr_performance_report }
      else
        format.html { render :new }
        format.json { render json: @cpr_performance_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cpr_performance_reports/1
  # PATCH/PUT /cpr_performance_reports/1.json
  def update
    respond_to do |format|
      if @cpr_performance_report.update(cpr_performance_report_params)
        format.html { redirect_to @cpr_performance_report, notice: 'Cpr performance report was successfully updated.' }
        format.json { render :show, status: :ok, location: @cpr_performance_report }
      else
        format.html { render :edit }
        format.json { render json: @cpr_performance_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cpr_performance_reports/1
  # DELETE /cpr_performance_reports/1.json
  def destroy
    @cpr_performance_report.destroy
    respond_to do |format|
      format.html { redirect_to cpr_performance_reports_url, notice: 'Cpr performance report was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cpr_performance_report
      @cpr_performance_report = CprPerformanceReport.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cpr_performance_report_params
      params.require(:cpr_performance_report).permit(:cpr_contract, :cpr_supplier, :cpr_client, :cpr_principal, :cpr_report_date, :cpr_work_percent_complete, :cpr_report_reason, :cpr_price_as_varied, :cpr_predicted_price, :cpr_actual_price, :cpr_total_extention_days, :cpr_adjusted_completion_date, :cpr_predicted_completion_date, :cpr_actual_completion_date, :cpr_comments, :cpr_reporting_officer, :cpr_contractor_acknowlages, :cpr_validating_officer, :score_time_management, :score_work_standard, :score_quality_management_system, :score_personnel, :score_subcontractors, :score_contract_admin, :score_coop_relations, :score_health_and_safety, :score_industrial_relations, :score_environmental_management, :score_training_management, :score_design_contractor, :score_indigenous_participation)
    end
end
