class CcrPerformanceReportsController < InheritedResources::Base

  private

    def ccr_performance_report_params
      params.require(:ccr_performance_report).permit(:contract_id, :supplier_id, :reporting_officer_name, :reporting_officer_email, :contract_type, :department_id, :division, :contract_location, :practical_completion_estimate, :practical_completion, :final_report, :final_value, :defects_liability, :supplier_name, :supplier_email, :score_cost, :score_time, :score_admin, :score_standards, :score_quality, :score_personnel, :score_subcontract, :score_communication, :score_safety, :score_environment, :score_design, :score_overall, :acceptance_name, :acceptance_email, :acceptance_status, :executive_name, :executive_email, :executive_status)
    end
end

