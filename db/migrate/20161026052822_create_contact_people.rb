class CreateContactPeople < ActiveRecord::Migration[5.0]
  def change
    create_table :contact_people do |t|

      t.timestamps
    end
  end
end
