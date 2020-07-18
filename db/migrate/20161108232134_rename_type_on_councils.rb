class RenameTypeOnCouncils < ActiveRecord::Migration[6.0]
  def change
    rename_column :councils , :type,  :council_type
  end
end
