class AddDeposit2ToProject < ActiveRecord::Migration[6.0]
  def change
	add_column :projects, :forapp, :boolean, default: false
	add_column :projects, :appnote, :text
	add_column :projects, :deposit2, :date
    	add_column :projects, :depomonth2, :date
	add_column :projects, :deposittype, :string
  end
end
