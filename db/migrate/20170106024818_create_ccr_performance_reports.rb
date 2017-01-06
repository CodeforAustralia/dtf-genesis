class CreateCcrPerformanceReports < ActiveRecord::Migration[5.0]
  def change
    create_table :ccr_performance_reports do |t|
      t.references :contract, foreign_key: true
      t.references :supplier, foreign_key: true
      t.string :reporting_officer_name
      t.string :reporting_officer_email
      t.string :contract_type
      t.references :department, foreign_key: true
      t.string :division
      t.string :contract_location
      t.date :practical_completion_estimate
      t.date :practical_completion
      t.date :final_report
      t.money :final_value
      t.date :defects_liability
      t.string :supplier_name
      t.string :supplier_email
      t.integer :score_cost
      t.integer :score_time
      t.integer :score_admin
      t.integer :score_standards
      t.integer :score_quality
      t.integer :score_personnel
      t.integer :score_subcontract
      t.integer :score_communication
      t.integer :score_safety
      t.integer :score_environment
      t.integer :score_design
      t.integer :score_overall
      t.string :acceptance_name
      t.string :acceptance_email
      t.integer :acceptance_status
      t.string :executive_name
      t.string :executive_email
      t.integer :executive_status

      t.timestamps
    end
  end
end
