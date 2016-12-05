class CreateReferencesToCsrPerformanceReport < ActiveRecord::Migration[5.0]
  def change
    add_reference :csr_performance_reports, :supplier, foreign_key: true
  end
end
