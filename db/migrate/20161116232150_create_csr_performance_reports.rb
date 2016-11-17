class CreateCsrPerformanceReports < ActiveRecord::Migration[5.0]
  def change
    create_table :csr_performance_reports do |t|
      t.string :csr_works_no
      t.boolean :csr_completion
      t.string :csr_createdby
      t.boolean :csr_progress
      t.text :csr_comment
      t.integer :csr_progress_rate
      t.integer :csr_staff_quality
      t.integer :csr_work_quality
      t.integer :csr_work_quantity
      t.integer :csr_coodination
      t.integer :csr_administration
      t.integer :csr_expr1012
      t.integer :csr_attitude_to_client
      t.integer :csr_pricing
      t.integer :csr_payment
      t.integer :csr_ohs
      t.integer :csr_ir 
      t.integer :csr_environment
      t.integer :csr_overall
      t.boolean :csr_satisfactory
      t.timestamps
    end
  end
end
