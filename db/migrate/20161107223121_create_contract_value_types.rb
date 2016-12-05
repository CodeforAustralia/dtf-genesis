class CreateContractValueTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :contract_value_types do |t|
      t.string :type_description
      t.string :type_shortname

      t.timestamps
    end
  end
end
