class AddKeyOnCsrContracts < ActiveRecord::Migration[5.0]
  def change
    add_reference :csr_contracts, :supplier, foreign_key: true
  end
end
