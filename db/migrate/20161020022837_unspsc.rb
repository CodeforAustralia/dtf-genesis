class Unspsc < ActiveRecord::Migration[6.0]
def change
    create_table :unspsc do |t|
      t.integer :unspsc_code
      t.string :unspsc_name 
      t.string :unspsc_alias
      t.string :child_category
      t.string :parent_category
      
      t.timestamps
    end
  end
end
