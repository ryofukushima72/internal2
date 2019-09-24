class ApprovalsController < ApplicationController
  skip_before_action :verify_authenticity_token

  before_action :authenticate_user!
  
  before_action :set_approval, only: [:approvalscommit, :destroy]

  # GET /approvals
  # GET /approvals.json
  def index
    @params_project = params[:project_id]
    @user = User.find(current_user.id)
    if params[:project_id].blank?
      @approvals = Approval.where(commit: false)
      @approvaled = Approval.where(commit: true)
      @project = Project.all
    else
      @approvals = Approval.where(project_id: params[:project_id]).where(commit: false)
      @approvaled = Approval.where(project_id: params[:project_id]).where(commit: true)
      @project = Project.find(params[:project_id])
    end
  end

  

  # POST /approvals
  # POST /approvals.json
  def create
    @approval = Approval.create(
      project_id: params[:project_id],
      user_id: params[:user_id],
      prelevel: params[:prelevel],
      level: params[:level])
    @project = Project.find(params[:project_id])
    @project.forapp = 1


    respond_to do |format|
      if @approval.save and @project.save
        format.html { redirect_back(fallback_location: root_path, notice: '申請成功') }
        format.json { render :show, status: :created, location: @approval }
      else
        format.html { redirect_back(fallback_location: root_path, notice: '申請失敗') }
        format.json { render json: @approval.errors, status: :unprocessable_entity }
      end
    end
  end

  def approvalscommit
    if current_user.superadmin?
      @approval.commit = "1"
      @approval.appuser = params[:appuser]
      @project = Project.find(params[:project_id])
      @project.level = @approval.level
      @project.forapp = 0
    else
      redirect_back(fallback_location: root_path, notice: '承認権限がありません。管理者にお問い合わせください。')
      return
    end


    if @approval.save and @project.save
      redirect_back(fallback_location: root_path, notice: '承認成功')
    else
      redirect_back(fallback_location: root_path, notice: '承認失敗')
    end

  end


  # PATCH/PUT /approvals/1
  # PATCH/PUT /approvals/1.json
  def update

    respond_to do |format|
      if @approval.update(approval_params)
        format.html { redirect_to @approval, notice: 'Approval was successfully updated.' }
        format.json { render :show, status: :ok, location: @approval }
      else
        format.html { render :edit }
        format.json { render json: @approval.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /approvals/1
  # DELETE /approvals/1.json
  def destroy
    @approval.destroy
    @project = Project.find(params[:project_id])
    @project.forapp = 0
    @project.save


    respond_to do |format|
      format.html { redirect_back(fallback_location: root_path, notice: 'Approval was successfully destroyed.') }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_approval
      @approval = Approval.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def approval_params
      params.require(:approval).permit(
          :project_id, 
          :user_id,
          :prelevel,
          :level) 
    end
end
