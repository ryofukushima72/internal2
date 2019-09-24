class AddPjNoToFileUploads < ActiveRecord::Migration[6.0]
  def change
	add_column :file_uploads, :pj_id, :integer
  end
end
