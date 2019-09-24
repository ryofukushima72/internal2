class AddProjectIdToFileUploads < ActiveRecord::Migration[6.0]
  def change
	add_column :file_uploads, :project_id, :integer
  end
end
