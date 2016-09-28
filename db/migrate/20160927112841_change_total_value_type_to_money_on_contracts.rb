class ChangeTotalValueTypeToMoneyOnContracts < ActiveRecord::Migration[5.0]
  def change
    change_table :contracts do |t|
      t.change :total_value, :money
    end
  end
  def down
    change_table :contracts do |t|
      t.change :total_value, :decimal
    end
  end
end
