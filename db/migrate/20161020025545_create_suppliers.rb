class CreateSuppliers < ActiveRecord::Migration[5.0]
  def change
    create_table :suppliers do |t|
      t.string :name
      t.string :abn
      t.string :acn
      t.string :address
      t.string :suburb
      t.string :state
      t.integer :postcode
      t.string :email

      t.timestamps
    end
  end
end
