class DropUnwantedUnspscTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :unspsc
  end
end
