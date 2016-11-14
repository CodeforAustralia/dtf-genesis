class CreateCprScores < ActiveRecord::Migration[5.0]
  def change
    create_table :cpr_scores do |t|
      t.integer :time_management
      t.integer :work_standard
      t.integer :quality_management_system
      t.integer :personnel
      t.integer :subcontractors
      t.integer :contract_admin
      t.integer :coop_relations
      t.integer :health_and_safety
      t.integer :industrial_relations
      t.integer :environmental_management
      t.integer :training_management
      t.integer :design_contractor
      t.integer :indigenous_participation
      t.references :cpr_report, foreign_key: true

      t.timestamps
    end
  end
end
