class CreateCouncils < ActiveRecord::Migration[6.0]
  def change
    create_table :councils do |t|
      t.string :codename
      t.string :name
      t.string :shortname
      t.string :type
      t.string :region_code

      t.timestamps
    end
  end
end
