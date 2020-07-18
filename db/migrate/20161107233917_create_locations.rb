class CreateLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :locations do |t|
      t.integer :record_no
      t.integer :supplier_no
      t.string :location_code
      t.string :supplier_type
      t.boolean :mail_to
      t.string :address_line1
      t.string :address_line2
      t.string :suburb
      t.integer :postcode
      t.string :po
      t.string :po_suburb
      t.string :po_postcode
      t.string :phone1
      t.string :phone2
      t.string :mobile
      t.string :fax
      t.string :email
      t.string :website
      t.string :title
      t.string :firstname
      t.string :surname
      t.date :updated
      t.string :state
      t.string :po_state
      t.boolean :metro

      t.timestamps
    end
  end
end
