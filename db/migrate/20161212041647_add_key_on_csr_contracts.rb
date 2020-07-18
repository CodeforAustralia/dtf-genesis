class AddKeyOnCsrContracts < ActiveRecord::Migration[6.0]
  def change
    add_reference :csr_contracts, :supplier, foreign_key: true
  end
end
