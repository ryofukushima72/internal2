class CreateRecordTables < ActiveRecord::Migration[6.0]
  def change
    create_table :recordtimes do |t|
    
	t.integer :user_id, null: false
	t.integer :recordstate_id, null: false
	t.datetime :rt
	t.boolean :commit, default: true, null: false
    	t.boolean :night, default: false
	t.datetime :begin
    
    end
    
    create_table :recordstates do |t|
        t.string :name
    end

    create_table :recordholidays do |t|

	t.integer :user_id, null: false
	t.date :rh
	t.boolean :half, default: true, null: false
	t.boolean :alt, default: true, null: false
	t.boolean :commit, default: true, null: false
    end


   add_column :users, :atfinish, :boolean, default: false
   add_column :users, :atwork, :boolean, default: false
   add_column :users, :atrest, :boolean, default: false
   add_column :users, :department_id, :integer
   add_column :users, :altholiday, :integer, default: 0
   add_column :users, :paidholiday, :integer, default: 10


  end
end
