class CreateReferencesToCprPerformanceReport < ActiveRecord::Migration[6.0]
  def change
    add_reference :cpr_performance_reports, :supplier, foreign_key: true
  end
end
