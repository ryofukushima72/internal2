class CreateFileUploads < ActiveRecord::Migration[6.0]
  def change
    create_table :file_uploads do |t|
	t.string :category
	t.string :file_name
	t.date :mtg
        t.timestamps null: false 

    end
  end
end
