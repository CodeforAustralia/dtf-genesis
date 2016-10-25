class CreateUnspscs < ActiveRecord::Migration[5.0]
  def change
    create_table :unspscs do |t|
      t.integer :unspsc_code
      t.string :unspsc_name

      t.timestamps
    end
  end
end
