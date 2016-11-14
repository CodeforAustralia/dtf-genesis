class CreateCprReports < ActiveRecord::Migration[5.0]
  def change
    create_table :cpr_reports do |t|
      t.integer :cpr_contract
      t.integer :cpr_contractor
      t.string :cpr_client
      t.string :cpr_principal
      t.date :cpr_report_date
      t.string :cpr_work_percent_complete
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

      t.timestamps
    end
  end
end
