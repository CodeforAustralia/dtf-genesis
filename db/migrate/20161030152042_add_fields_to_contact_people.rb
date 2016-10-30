class AddFieldsToContactPeople < ActiveRecord::Migration[5.0]
  def change
    add_column :contact_people, :name, :string
    add_column :contact_people, :phone, :string
    add_column :contact_people, :fax, :string
    add_column :contact_people, :email, :string
  end
end
