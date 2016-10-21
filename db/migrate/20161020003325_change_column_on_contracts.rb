class ChangeColumnOnContracts < ActiveRecord::Migration[5.0]
  def change
    rename_column :contracts, :suppplier_id, :supplier_id
  end
end
