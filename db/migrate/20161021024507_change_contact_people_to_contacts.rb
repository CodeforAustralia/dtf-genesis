class ChangeContactPeopleToContacts < ActiveRecord::Migration[5.0]
  def change
    rename_table :contact_people, :contacts 
  end
end
