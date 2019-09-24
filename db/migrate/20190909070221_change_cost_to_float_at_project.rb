class ChangeCostToFloatAtProject < ActiveRecord::Migration[6.0]
  def change
	change_column :projects, :plancost, :float
	change_column :projects, :realcost, :float
  end
end
