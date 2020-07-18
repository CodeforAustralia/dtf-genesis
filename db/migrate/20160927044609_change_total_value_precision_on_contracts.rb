class ChangeTotalValuePrecisionOnContracts < ActiveRecord::Migration[6.0]
  def up
    change_table :contracts do |t|
      t.change :total_value, :decimal, :precision => 10, :scale => 2
    end
  end
  def down
    change_table :contracts do |t|
      t.change :total_value, :decimal
    end
  end
end
