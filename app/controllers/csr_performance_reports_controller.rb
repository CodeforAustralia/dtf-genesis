class CsrPerformanceReportsController < ApplicationController
  before_action :set_csr_performance_report, only: [:show, :edit, :update, :destroy]

  # GET /csr_performance_reports
  # GET /csr_performance_reports.json
  def index
    @csr_reports = CsrPerformanceReport.all
  end

  # GET /csr_performance_reports/1
  # GET /csr_performance_reports/1.json
  def show
    supplier = Supplier.find(params[:supplier_id])
    @csr_reports = supplier.csr_performance_reports
    @csr_report = @csr_reports.find(params[:id])
  end

  # GET /csr_performance_reports/new
  def new
    @csr_performance_report = CsrPerformanceReport.new
  end

  # GET /csr_performance_reports/1/edit
  def edit
  end

  # POST /csr_performance_reports
  # POST /csr_performance_reports.json
  def create
    @csr_performance_report = CsrPerformanceReport.new(csr_performance_report_params)

    respond_to do |format|
      if @csr_performance_report.save
        format.html { redirect_to @csr_performance_report, notice: 'Csr performance report was successfully created.' }
        format.json { render :show, status: :created, location: @csr_performance_report }
      else
        format.html { render :new }
        format.json { render json: @csr_performance_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /csr_performance_reports/1
  # PATCH/PUT /csr_performance_reports/1.json
  def update
    respond_to do |format|
      if @csr_performance_report.update(csr_performance_report_params)
        format.html { redirect_to @csr_performance_report, notice: 'Csr performance report was successfully updated.' }
        format.json { render :show, status: :ok, location: @csr_performance_report }
      else
        format.html { render :edit }
        format.json { render json: @csr_performance_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /csr_performance_reports/1
  # DELETE /csr_performance_reports/1.json
  def destroy
    @csr_performance_report.destroy
    respond_to do |format|
      format.html { redirect_to csr_performance_reports_url, notice: 'Csr performance report was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_csr_performance_report
      @csr_performance_report = CsrPerformanceReport.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def csr_performance_report_params
      params.fetch(:csr_performance_report, {})
    end
end
