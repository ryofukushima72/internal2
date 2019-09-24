class AddColumnsToProject < ActiveRecord::Migration[6.0]
  def change
	  add_column :projects, :pf, :float, default: 1.0, null: false
	  add_column :projects, :pfdummy, :float, default: 1.0, null: false
	  add_column :projects, :team, :string
	  add_column :projects, :tech, :string
	  add_column :projects, :type, :string
	  add_column :projects, :level, :string
	  add_column :projects, :sum19, :integer, default: 0, null: false
	  add_column :projects, :sum19pf, :integer, default: 0, null: false
	  add_column :projects, :counta, :integer, default: 0, null: false
	  add_column :projects, :countb, :integer, default: 0, null: false
	  add_column :projects, :countc, :integer, default: 0, null: false
	  add_column :projects, :countd, :integer, default: 0, null: false
	  add_column :projects, :counte, :integer, default: 0, null: false
	  add_column :projects, :countf, :integer, default: 0, null: false
	  add_column :projects, :countg, :integer, default: 0, null: false
  end
end
