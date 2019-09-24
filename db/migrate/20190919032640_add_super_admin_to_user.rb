class AddSuperAdminToUser < ActiveRecord::Migration[6.0]
  def change
	  add_column :users, :fname, :string
	  add_column :users, :gname, :string
	  add_column :users, :usercode, :string
	  add_column :users, :superadmin, :boolean, default: false
  end
end
