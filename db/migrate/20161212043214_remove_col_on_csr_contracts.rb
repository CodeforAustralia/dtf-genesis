class RemoveColOnCsrContracts < ActiveRecord::Migration[5.0]
  def change
    remove_column :csr_contracts, :csr_supplier_id, :string
  end
end
