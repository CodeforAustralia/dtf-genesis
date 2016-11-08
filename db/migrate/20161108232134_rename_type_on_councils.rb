class RenameTypeOnCouncils < ActiveRecord::Migration[5.0]
  def change
    rename_column :councils , :type,  :council_type
  end
end
