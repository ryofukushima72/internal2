class RenameTypeToSalestypeAtProject < ActiveRecord::Migration[6.0]
  def change
	  rename_column :projects, :type, :salestype
  end
end
