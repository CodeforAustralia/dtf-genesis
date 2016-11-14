class CprReportsController < ApplicationController
  before_action :set_cpr_report, only: [:show, :edit, :update, :destroy]

  # GET /cpr_reports
  # GET /cpr_reports.json
  def index
    @cpr_reports = CprReport.all
  end

  # GET /cpr_reports/1
  # GET /cpr_reports/1.json
  def show
  end

  # GET /cpr_reports/new
  def new
    @cpr_report = CprReport.new
  end

  # GET /cpr_reports/1/edit
  def edit
  end

  # POST /cpr_reports
  # POST /cpr_reports.json
  def create
    @cpr_report = CprReport.new(cpr_report_params)

    respond_to do |format|
      if @cpr_report.save
        format.html { redirect_to @cpr_report, notice: 'Cpr report was successfully created.' }
        format.json { render :show, status: :created, location: @cpr_report }
      else
        format.html { render :new }
        format.json { render json: @cpr_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cpr_reports/1
  # PATCH/PUT /cpr_reports/1.json
  def update
    respond_to do |format|
      if @cpr_report.update(cpr_report_params)
        format.html { redirect_to @cpr_report, notice: 'Cpr report was successfully updated.' }
        format.json { render :show, status: :ok, location: @cpr_report }
      else
        format.html { render :edit }
        format.json { render json: @cpr_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cpr_reports/1
  # DELETE /cpr_reports/1.json
  def destroy
    @cpr_report.destroy
    respond_to do |format|
      format.html { redirect_to cpr_reports_url, notice: 'Cpr report was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cpr_report
      @cpr_report = CprReport.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cpr_report_params
      params.require(:cpr_report).permit(:cpr_contract, :cpr_contractor, :cpr_client, :cpr_principal, :cpr_report_date, :cpr_work_percent_complete, :cpr_report_reason, :cpr_price_as_varied, :cpr_predicted_price, :cpr_actual_price, :cpr_total_extention_days, :cpr_adjusted_completion_date, :cpr_predicted_completion_date, :cpr_actual_completion_date, :cpr_comments, :cpr_reporting_officer, :cpr_contractor_acknowlages, :cpr_validating_officer)
    end
end
