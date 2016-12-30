class CreateReferencesToCprPerformanceReport < ActiveRecord::Migration[5.0]
  def change
    add_reference :cpr_performance_reports, :supplier, foreign_key: true
  end
end
