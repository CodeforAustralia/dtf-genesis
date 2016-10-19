class AddFieldsToContracts < ActiveRecord::Migration[5.0]
  def change
    add_column :contracts, :department_index, :integer
    add_column :contracts, :contract_type_index, :integer
    add_column :contracts, :value_type_index, :integer
    add_column :contracts, :status_index, :integer
    add_column :contracts, :unspc_code, :integer
    add_column :contracts, :contract_description, :text
  end
end
