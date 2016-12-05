class AddColumnsToUnspsc < ActiveRecord::Migration[5.0]
  def change
    add_column :unspscs, :unspsc_alias, :string
    add_column :unspscs, :child_category, :string
    add_column :unspscs, :parent_category, :string
  end
end
