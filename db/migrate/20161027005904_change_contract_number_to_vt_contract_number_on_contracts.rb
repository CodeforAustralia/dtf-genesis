class ChangeContractNumberToVtContractNumberOnContracts < ActiveRecord::Migration[6.0]
  def change
    rename_column :contracts, :contract_number, :vt_contract_number
  end
end
