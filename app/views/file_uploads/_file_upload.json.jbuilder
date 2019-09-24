json.extract! file_upload, :id, :pj_id, :category, :file_name, :created_at, :updated_at
json.url file_upload_url(file_upload, format: :json)
