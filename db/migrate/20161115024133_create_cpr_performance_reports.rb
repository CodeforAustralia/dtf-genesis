class CreateCprPerformanceReports < ActiveRecord::Migration[5.0]
  def change
    create_table :cpr_performance_reports do |t|
      t.integer :cpr_contract
      t.integer :cpr_supplier
      t.string :cpr_client
      t.string :cpr_principal
      t.date :cpr_report_date
      t.integer :cpr_work_percent_complete
      t.string :cpr_report_reason
      t.money :cpr_price_as_varied
      t.money :cpr_predicted_price
      t.money :cpr_actual_price
      t.integer :cpr_total_extention_days
      t.date :cpr_adjusted_completion_date
      t.date :cpr_predicted_completion_date
      t.date :cpr_actual_completion_date
      t.text :cpr_comments
      t.integer :cpr_reporting_officer
      t.boolean :cpr_contractor_acknowlages
      t.integer :cpr_validating_officer
      t.integer :score_time_management
      t.integer :score_work_standard
      t.integer :score_quality_management_system
      t.integer :score_personnel
      t.integer :score_subcontractors
      t.integer :score_contract_admin
      t.integer :score_coop_relations
      t.integer :score_health_and_safety
      t.integer :score_industrial_relations
      t.integer :score_environmental_management
      t.integer :score_training_management
      t.integer :score_design_contractor
      t.integer :score_indigenous_participation

      t.timestamps
    end
  end
end
