class CreateCsrContracts < ActiveRecord::Migration[6.0]
  def change
    create_table :csr_contracts do |t|
      t.string :csr_works_no
      t.string :csr_supplier_id
      t.string :csr_supplier_type
      t.text :csr_description
      t.string :csr_location
      t.string :csr_category
      t.money :csr_value
      t.string :csr_client
      t.date :csr_start_date
      t.date :csr_finish_date
      t.text :csr_comment
      t.string :source, :default => "csr"
      t.timestamps
    end
  end
end