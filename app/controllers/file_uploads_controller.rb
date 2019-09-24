class FileUploadsController < ApplicationController
  before_action :set_file_upload, only: [:show, :edit, :update, :destroy]

  # GET /file_uploads
  # GET /file_uploads.json
  def index
    
    if request.referer.index('projects') != nil
      @@request_referer = request.referer
      @request_referer = @@request_referer
    end
    

    @file_uploads1 = FileUpload.where(category: 'e.議事録')
    @file_uploads2 = FileUpload.where.not(category: 'e.議事録')

    if params[:sale_id] != nil

      @file_uploads1 = FileUpload.where(category: 'e.議事録').where(sale_id: params[:sale_id])
      @file_uploads2 = FileUpload.where.not(category: 'e.議事録').where(sale_id: params[:sale_id])

    end

    @users = User.where(id: current_user.id)

    if params[:project_id] != nil
	    @params_project_id= params[:project_id]
      @project = Project.find(@params_project_id)
      
      file_upload = FileUpload.where(project_id: params[:project_id])
      file_a = file_upload.where(category: 'a.NDA').count
      file_b = file_upload.where(category: 'b.見積書').count
      file_c = file_upload.where(category: 'c.契約書').count
      file_d = file_upload.where(category: 'd.請求書').count
      file_e = file_upload.where(category: 'e.議事録').count
      file_f = file_upload.where(category: 'f.検収書').count
      file_g = file_upload.where(category: 'g.注文書').count

      @project.counta = file_a
      @project.countb = file_b
      @project.countc = file_c
      @project.countd = file_d
      @project.counte = file_e
      @project.countf = file_f
      @project.countg = file_g

      @project.save

    else

      # @projects = Project.all
      # @projects.each do |p|
      #   file_upload = FileUpload.where(project_id: p.id)
      #   p.counta = file_upload.where(category: 'a.NDA').count
      #   p.countb = file_upload.where(category: 'b.見積書').count
      #   p.countc = file_upload.where(category: 'c.契約書').count
      #   p.countd = file_upload.where(category: 'd.請求書').count
      #   p.counte = file_upload.where(category: 'e.議事録').count
      #   p.countf = file_upload.where(category: 'f.検収書').count
      #   p.countg = file_upload.where(category: 'g.注文書').count

      #   p.save
      # end


    end
  
  end

  def show
 	extension=@file_upload.file_name.split('.')
	send_file Rails.root.join('public', 'docs', @file_upload.file_name),
	:type=>"application/#{extension[1]}", :x_sendfile=>true, :disposition=>'inline'
  
  end

  # GET /file_uploads/new
  def new
    @file_upload = FileUpload.new
  end

  # GET /file_uploads/1/edit
  def edit
  end

  # POST /file_uploads
  # POST /file_uploads.json
  def create
    @file_upload = FileUpload.new(file_upload_params)
	uploaded_io=params[:file_upload][:file_name]
	File.open(Rails.root.join('public','docs', uploaded_io.original_filename),'wb') do |file|
		file.write(uploaded_io.read)
	end
	@file_upload.file_name=uploaded_io.original_filename
    respond_to do |format|
      if @file_upload.save
        #format.html { redirect_to @file_upload, notice: 'File upload was successfully created.' }
        # format.html { redirect_to :back, notice: 'ファイルアップロードが完了しました。' }
        format.html { redirect_back(fallback_location: root_path, notice: 'ファイルアップロードが完了しました。') }
        format.json { render :show, status: :created, location: @file_upload }
	
      else
        # format.html { redirect_to :back, notice: 'ファイルアップロード失敗' }
        format.html { redirect_back(fallback_location: root_path, notice: 'アップロード失敗') }
        format.json { render json: @file_upload.errors, status: :unprocessable_entity }
	
      end
    end
  end

  # PATCH/PUT /file_uploads/1
  # PATCH/PUT /file_uploads/1.json
  def update
    respond_to do |format|
      if @file_upload.update(file_upload_params)
        format.html { redirect_to @file_upload, notice: 'File upload was successfully updated.' }
        format.json { render :show, status: :ok, location: @file_upload }
      else
        format.html { redirect_to @file_upload, notice: 'アップロード失敗' }
        format.json { render json: @file_upload.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /file_uploads/1
  # DELETE /file_uploads/1.json
  def destroy
    @file_upload.destroy
    respond_to do |format|
      #format.html { redirect_to file_uploads_url, notice: 'File upload was successfully destroyed.' }
      # format.html { redirect_to :back, notice: 'ファイルを削除しました。' }
      format.html { redirect_back(fallback_location: root_path, notice: 'ファイルを削除しました。') }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_file_upload
      @file_upload = FileUpload.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def file_upload_params
      # params.require(:file_upload).permit(:project_id, :category, :file_name, :sale_id, :mtg)
      params.require(:file_upload).permit(:project_id, :category, :file_name, :mtg)

    end
end
