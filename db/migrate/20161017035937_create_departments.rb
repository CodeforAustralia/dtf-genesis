class CreateDepartments < ActiveRecord::Migration[5.0]
  def change
    create_table :departments do |t|
      t.string :name
      t.string :short_name
      t.integer :vt_number

      t.timestamps
    end
  end
end
