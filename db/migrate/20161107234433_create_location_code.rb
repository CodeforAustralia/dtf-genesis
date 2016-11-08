class CreateLocationCode < ActiveRecord::Migration[5.0]
  def change
    create_table :location_codes do |t|
      t.string :code
      t.string :description
    end
  end
end


