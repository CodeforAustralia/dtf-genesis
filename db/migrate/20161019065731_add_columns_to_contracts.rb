class AddColumnsToContracts < ActiveRecord::Migration[6.0]
  def change
    add_column :contracts, :department_id, :integer
    add_column :contracts, :suppplier_id, :integer
    add_column :contracts, :contact_id, :integer
    add_column :contracts, :contract_type_id, :integer
    add_column :contracts, :unspsc_id, :integer
    add_column :contracts, :project_id, :integer
    add_column :contracts, :address, :string
    add_column :contracts, :status_id, :integer
  end
end
