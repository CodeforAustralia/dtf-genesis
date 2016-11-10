class ModifyColumnsInContracts < ActiveRecord::Migration[5.0]
  def change
    change_table :contracts do |table|
      table.remove :status
      table.integer :vt_status_id
      table.rename :title, :vt_title
      table.rename :start_date, :vt_start_date
      table.rename :end_date, :vt_end_date
      table.rename :total_value, :vt_total_value
      table.rename :department_index, :vt_department_id
      table.rename :contract_type_index, :vt_contract_type_id
      table.rename :value_type_index, :vt_value_type_id
      table.rename :unspc_code, :vt_unspc_id
      table.rename :contract_description, :vt_contract_description
      table.remove :department_id
      table.rename :supplier_id, :vt_supplier_id
      table.remove :contact_id
      table.remove :contract_type_id, :unspsc_id
      table.rename :address, :vt_address
      table.integer :vt_address_id
      table.remove :status_id
      table.string :vt_agency_person
      table.string :vt_agency_phone
      table.string :vt_agency_email
      table.string :vt_supplier_name
      table.string :vt_supplier_abn
      table.string :vt_supplier_acn
      table.string :vt_supplier_address
      table.string :vt_supplier_email
    end
  end
end
