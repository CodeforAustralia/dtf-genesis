class DropUnwantedUnspscTable < ActiveRecord::Migration[5.0]
  def change
    drop_table :unspsc
  end
end
