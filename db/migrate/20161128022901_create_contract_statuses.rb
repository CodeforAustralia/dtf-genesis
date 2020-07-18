class CreateContractStatuses < ActiveRecord::Migration[6.0]
  def change
    create_table :contract_statuses do |t|
      t.string :name
      t.string :short_name

      t.timestamps
    end
  end
end
