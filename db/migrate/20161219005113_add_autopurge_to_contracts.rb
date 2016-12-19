class AddAutopurgeToContracts < ActiveRecord::Migration[5.0]
  def up
    add_column :contracts, :autopurge, :boolean
    Contract.update_all ["autopurge = ?", false]
  end
  def down
    remove_column :contracts, :autopurge
  end
end
