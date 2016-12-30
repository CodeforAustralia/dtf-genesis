class AddOcdsidToContract < ActiveRecord::Migration[5.0]
  def change
    change_table :contracts do |table|
      table.string :ocds_id
    end
  end
end
