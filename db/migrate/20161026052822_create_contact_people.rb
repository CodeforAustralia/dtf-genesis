class CreateContactPeople < ActiveRecord::Migration[6.0]
  def change
    create_table :contact_people do |t|

      t.timestamps
    end
  end
end
