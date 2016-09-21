class CreateContracts < ActiveRecord::Migration[5.0]
  def change
    create_table :contracts do |t|
      t.string :contract_number
      t.string :status
      t.string :title
      t.date :start_date
      t.date :end_date
      t.numeric :total_value

      t.timestamps
    end
  end
end
