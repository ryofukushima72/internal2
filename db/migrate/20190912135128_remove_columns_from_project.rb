class RemoveColumnsFromProject < ActiveRecord::Migration[6.0]
  def change

	  remove_column :projects, :level_id, :integer
	  remove_column :projects, :type_id, :integer
	  remove_column :projects, :team_id, :integer
	  remove_column :projects, :tech_id, :integer
	  remove_column :projects, :factor_id, :integer

  end
end
