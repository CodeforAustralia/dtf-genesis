class CreateContactPeople < ActiveRecord::Migration[5.0]
  def change
    create_table :contact_people do |t|
      t.string :name
      t.string :phone
      t.string :fax
      t.string :email

      t.timestamps
    end
  end
end
