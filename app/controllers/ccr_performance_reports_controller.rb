class CcrPerformanceReportsController < InheritedResources::Base

  def new
    @ccr_performance_report = CcrPerformanceReport.new
    if params[:contract_id] && params[:contract_id] != 0
      @contract = Contract.find(params[:contract_id])
      puts "::: @contract.vt_department_id: #{@contract.vt_department_id}"
      puts "::: @contract.vt_department_name: #{@contract.vt_contract_number}"
      if @contract.vt_department_id != 0
        @department = Department.where(vt_number: @contract.vt_department_id).first
      else
        @department = Department.new(id: 0)
      end
      if @contract.vt_supplier_id != 0
        @supplier = Supplier.find(@contract.vt_supplier_id)
      else
        @supplier = Supplier.new(id: 0)
      end
    end
  end

  def edit
    @ccr_performance_report = CcrPerformanceReport.find(params[:id])
    # puts " ::: EDIT id: #{params[:id]}"
    if @ccr_performance_report && @ccr_performance_report.contract_id != 0
      @contract = Contract.find(@ccr_performance_report.contract_id)
      if @contract.vt_department_id != 0
        @department = Department.where(vt_number: @contract.vt_department_id).first
      else
        @department = Department.new(id: 0)
      end
      if @contract.vt_supplier_id != 0
        @supplier = Supplier.find(@contract.vt_supplier_id)
      else
        @supplier = Supplier.new(id: 0)
      end
    end
  end

  def show
    @ccr_performance_report = CcrPerformanceReport.find(params[:id])
    if @ccr_performance_report && @ccr_performance_report.contract_id != 0
      @contract = Contract.find(@ccr_performance_report.contract_id)
    end
  end


  private

    def ccr_performance_report_params
      params.require(:ccr_performance_report).permit(:contract_id, :supplier_id, :reporting_officer_name, :reporting_officer_email, :contract_type, :department_id, :division, :contract_location, :practical_completion_estimate, :practical_completion, :final_report, :final_value, :defects_liability, :supplier_name, :supplier_email, :score_cost, :score_time, :score_admin, :score_standards, :score_quality, :score_personnel, :score_subcontract, :score_communication, :score_safety, :score_environment, :score_design, :score_overall, :acceptance_name, :acceptance_email, :acceptance_status, :executive_name, :executive_email, :executive_status)
    end
end
