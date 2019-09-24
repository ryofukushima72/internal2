class ProjectsController < ApplicationController
	
	before_action :authenticate_user!
	before_action :set_project, only: [:show, :edit, :update, :destroy]
	# before_action :projects_path_with_search_params, only: [:index]
  # before_action :set_prev_search_params, only: [:edit, :new]
  # before_action :projects_path_with_search_params_action, only: [:edit, :update]
	
    def new
        @project = Project.new
        @@request_referer = request.referer
    end

    def create
      @project = Project.new(project_params)
      
      respond_to do |format|
		if @project.update(project_params)
      # @time = Date.today
      # year_date_string= @time.to_s.split("-")
			# year_string = year_date_string[0].slice(2,2)
			# month_string = year_date_string[1]
      # @column_name="y"+year_string+month_string
      @project.sum19 = @project.y1904 + @project.y1905 + @project.y1906 + @project.y1907 + @project.y1908 + @project.y1909 + @project.y1910 + @project.y1911 + @project.y1912 + @project.y2001 + @project.y2002 + @project.y2003
      if @column_name = 'y1909'
        @project.sum19pf = @project.y1904 + @project.y1905 + @project.y1906 + @project.y1907 + @project.y1908 + (@project.y1909 + @project.y1910 + @project.y1911 + @project.y1912 + @project.y2001 + @project.y2002 + @project.y2003)*@project.pf
      elsif @column_name = 'y1910'
        @project.sum19pf = @project.y1904 + @project.y1905 + @project.y1906 + @project.y1907 + @project.y1908 + @project.y1909 + (@project.y1910 + @project.y1911 + @project.y1912 + @project.y2001 + @project.y2002 + @project.y2003)*@project.pf
      elsif @column_name = 'y1911'
        @project.sum19pf = @project.y1904 + @project.y1905 + @project.y1906 + @project.y1907 + @project.y1908 + @project.y1909 + @project.y1910 + (@project.y1911 + @project.y1912 + @project.y2001 + @project.y2002 + @project.y2003)*@project.pf
      elsif @column_name = 'y1912'
        @project.sum19pf = @project.y1904 + @project.y1905 + @project.y1906 + @project.y1907 + @project.y1908 + @project.y1909 + @project.y1910 + @project.y1911 + (@project.y1912 + @project.y2001 + @project.y2002 + @project.y2003)*@project.pf
      elsif @column_name = 'y2001'
        @project.sum19pf = @project.y1904 + @project.y1905 + @project.y1906 + @project.y1907 + @project.y1908 + @project.y1909 + @project.y1910 + @project.y1911 + @project.y1912 + (@project.y2001 + @project.y2002 + @project.y2003)*@project.pf
      elsif @column_name = 'y2002'
        @project.sum19pf = @project.y1904 + @project.y1905 + @project.y1906 + @project.y1907 + @project.y1908 + @project.y1909 + @project.y1910 + @project.y1911 + @project.y1912 + @project.y2001 + (@project.y2002 + @project.y2003)*@project.pf
      elsif @column_name = 'y2003'
        @project.sum19pf = @project.y1904 + @project.y1905 + @project.y1906 + @project.y1907 + @project.y1908 + @project.y1909 + @project.y1910 + @project.y1911 + @project.y1912 + @project.y2001 + @project.y2002 + @project.y2003*@project.pf
      end
      


      @project.update(project_params)

      if @project.level.in?(['A:Advisory','P:POC','D:開発', 'M:運用', 'T:追加学習', 'R:Royalty'])
        @approval = Approval.create(
        project_id: @project.id,
        user_id: current_user.id,
        prelevel: '新規',
        level: @project.level)

        
        @project.forapp = 1
        if @project.save and @approval.save
        else
          redirect_to @@request_referer, notice: '登録が失敗しました。'
          return
        end

      end
    
		  format.html { redirect_to @@request_referer, notice: '登録が完了しました。' }
		  format.json { render :show, status: :ok, location: @project }
		else
		  format.html { redirect_to @@request_referer, notice: '登録が失敗しました。' }
		  format.json { render json: @project.errors, status: :unprocessable_entity }
		end
	  end
	end
  

    def show
    end

    def edit
      @@request_referer = request.referer
      
    end
  
    def update
      
      if @project.level.in?(['F:完了','G:休眠','H:失注'])
        if current_user.superadmin?
          
        else
          redirect_to @@request_referer, notice: '完了・休眠・失注のPJは変更できません。管理者にお問い合わせください。' 
          return
        end
      end      

      respond_to do |format|

      if @project.update(project_params2)
      
        @project.sum19 = @project.y1904 + @project.y1905 + @project.y1906 + @project.y1907 + @project.y1908 + @project.y1909 + @project.y1910 + @project.y1911 + @project.y1912 + @project.y2001 + @project.y2002 + @project.y2003
      if @@column_name = 'y1909'
        @project.sum19pf = @project.y1904 + @project.y1905 + @project.y1906 + @project.y1907 + @project.y1908 + (@project.y1909 + @project.y1910 + @project.y1911 + @project.y1912 + @project.y2001 + @project.y2002 + @project.y2003)*@project.pf
      elsif @@column_name = 'y1910'
        @project.sum19pf = @project.y1904 + @project.y1905 + @project.y1906 + @project.y1907 + @project.y1908 + @project.y1909 + (@project.y1910 + @project.y1911 + @project.y1912 + @project.y2001 + @project.y2002 + @project.y2003)*@project.pf
      elsif @@column_name = 'y1911'
        @project.sum19pf = @project.y1904 + @project.y1905 + @project.y1906 + @project.y1907 + @project.y1908 + @project.y1909 + @project.y1910 + (@project.y1911 + @project.y1912 + @project.y2001 + @project.y2002 + @project.y2003)*@project.pf
      elsif @@column_name = 'y1912'
        @project.sum19pf = @project.y1904 + @project.y1905 + @project.y1906 + @project.y1907 + @project.y1908 + @project.y1909 + @project.y1910 + @project.y1911 + (@project.y1912 + @project.y2001 + @project.y2002 + @project.y2003)*@project.pf
      elsif @@column_name = 'y2001'
        @project.sum19pf = @project.y1904 + @project.y1905 + @project.y1906 + @project.y1907 + @project.y1908 + @project.y1909 + @project.y1910 + @project.y1911 + @project.y1912 + (@project.y2001 + @project.y2002 + @project.y2003)*@project.pf
      elsif @@column_name = 'y2002'
        @project.sum19pf = @project.y1904 + @project.y1905 + @project.y1906 + @project.y1907 + @project.y1908 + @project.y1909 + @project.y1910 + @project.y1911 + @project.y1912 + @project.y2001 + (@project.y2002 + @project.y2003)*@project.pf
      elsif @@column_name = 'y2003'
        @project.sum19pf = @project.y1904 + @project.y1905 + @project.y1906 + @project.y1907 + @project.y1908 + @project.y1909 + @project.y1910 + @project.y1911 + @project.y1912 + @project.y2001 + @project.y2002 + @project.y2003*@project.pf
      end

      

	
			@project.update(project_params2)
			  format.html { redirect_to @@request_referer, notice: '更新が完了しました。' }
			  format.json { render :show, status: :ok, location: @project }
			else
			  format.html { redirect_to @@request_referer, notice: '更新が失敗しました。' }
			  format.json { render json: @project.errors, status: :unprocessable_entity }
			end
		  end
		end
	  

      
  def index
    	   
		
		@users = User.where(id: current_user.id)
		@time = Date.today
		# @timeをインスタンス変数として使用する。=>20190830
			
			year_date_string= @time.to_s.split("-")
			year_string = year_date_string[0].slice(2,2)
			month_string = year_date_string[1]
		@column_name="y"+year_string+month_string
		@@column_name = @column_name
	
	
		#初期開発時のコード。アップロードのみ。	
		# @file_upload=FileUpload.new
		 
		# @file_uploads=FileUpload.all
		
		# Project.update_all('sum_int_month_rf =( y1904 + y1905 + y1906 + y1907 + y1908 + y1909 + y1910 + y1911 + y1912+ y2001 + y2002+ y2003) ')	
    
		project = Project.all
		@q = project.ransack(params[:q])
		@q.level_eq_any = 'S:営業', 'A:Advisory', 'P:POC', 'D:開発', 'M:運用', 'T:追加学習', 'R:Royalty' unless params[:q]	
		projects = @q.result(distinct: false)#(distinct: true)重複を避けて表示=> コラムの合計値を計算するときにうまくいかない
	
		@projects = projects#.joins(:type, :factor)
		#.where.not(level:['G:休眠','H:失注','F:完了'])
		
		# @temp=Project.find_by_sql(['select y1801 from projects;'])
		dummy = 1
		# input value display
		@total_y1804=BigDecimal(@projects.sum(:y1804).to_s)
		@total_y1805=BigDecimal(@projects.sum(:y1805).to_s)
		@total_y1806=BigDecimal(@projects.sum(:y1806).to_s)
		@total_y1807=BigDecimal(@projects.sum(:y1807).to_s)
		@total_y1808=BigDecimal(@projects.sum(:y1808).to_s)
		@total_y1809=BigDecimal(@projects.sum(:y1809).to_s)
		@total_y1810=BigDecimal(@projects.sum(:y1810).to_s)
		@total_y1811=BigDecimal(@projects.sum(:y1811).to_s)
		@total_y1812=BigDecimal(@projects.sum(:y1812).to_s)
		@total_y1901=BigDecimal(@projects.sum(:y1901).to_s)
		@total_y1902=BigDecimal(@projects.sum(:y1902).to_s)
		@total_y1903=BigDecimal(@projects.sum(:y1903).to_s)
    @total_y1904=BigDecimal(@projects.sum("y1904*pfdummy").to_s)
    
		@total_y1905=BigDecimal(@projects.sum(:y1905).to_s)
		@total_y1906=BigDecimal(@projects.sum(:y1906).to_s)
		@total_y1907=BigDecimal(@projects.sum(:y1907).to_s)
		@total_y1908=BigDecimal(@projects.sum(:y1908).to_s)
		@total_y1909=BigDecimal(@projects.sum(:y1909).to_s)
		@total_y1910=BigDecimal(@projects.sum(:y1910).to_s)
		@total_y1911=BigDecimal(@projects.sum(:y1911).to_s)
		@total_y1912=BigDecimal(@projects.sum(:y1912).to_s)
		@total_y2001=BigDecimal(@projects.sum(:y2001).to_s)
		@total_y2002=BigDecimal(@projects.sum(:y2002).to_s)
    @total_y2003=BigDecimal(@projects.sum(:y2003).to_s)
    @sum_projects_month = @total_y1904 + @total_y1905 + @total_y1906 + @total_y1907 + @total_y1908 + @total_y1909 + @total_y1910 + @total_y1911 + @total_y1912 + @total_y2001 + @total_y2002 + @total_y2003
		
	
		# input value * risk_factor
		@total_y1804_and_rf=BigDecimal(@projects.sum("y1804").to_s)
		@total_y1805_and_rf=BigDecimal(@projects.sum("y1805").to_s)
		@total_y1806_and_rf=BigDecimal(@projects.sum("y1806").to_s)
		@total_y1807_and_rf=BigDecimal(@projects.sum("y1807").to_s)
    @total_y1808_and_rf=BigDecimal(@projects.sum("y1808").to_s)
    @total_y1809_and_rf=BigDecimal(@projects.sum("y1809").to_s)
    @total_y1810_and_rf=BigDecimal(@projects.sum("y1810").to_s)
		@total_y1811_and_rf=BigDecimal(@projects.sum("y1811").to_s)
		@total_y1812_and_rf=BigDecimal(@projects.sum("y1812").to_s)
		@total_y1901_and_rf=BigDecimal(@projects.sum("y1901").to_s)
		@total_y1902_and_rf=BigDecimal(@projects.sum("y1902").to_s)
		@total_y1903_and_rf=BigDecimal(@projects.sum("y1903").to_s)
		@total_y1904_and_rf=BigDecimal(@projects.sum("y1904").to_s)
		@total_y1905_and_rf=BigDecimal(@projects.sum("y1905").to_s)
		@total_y1906_and_rf=BigDecimal(@projects.sum("y1906").to_s)
		@total_y1907_and_rf=BigDecimal(@projects.sum("y1907").to_s)
    @total_y1908_and_rf=BigDecimal(@projects.sum("y1908").to_s)
    if @column_name.in?(['y1905','y1906','y1907','y1908', 'y1909'])
      @total_y1909_and_rf=BigDecimal(@projects.sum("y1909*pf").to_s)
    else
      @total_y1909_and_rf=BigDecimal(@projects.sum(:y1909).to_s)
    end
    if @column_name.in?(['y1905','y1906','y1907','y1908', 'y1909', 'y1910'])
      @total_y1910_and_rf=BigDecimal(@projects.sum("y1910*pf").to_s)
    else
      @total_y1910_and_rf=BigDecimal(@projects.sum(:y1910).to_s)
    end
    if @column_name.in?(['y1905','y1906','y1907','y1908', 'y1909', 'y1910', 'y1911'])
      @total_y1911_and_rf=BigDecimal(@projects.sum("y1911*pf").to_s)
    else
      @total_y1911_and_rf=BigDecimal(@projects.sum("y1911").to_s)
    end
    if @column_name.in?(['y1905','y1906','y1907','y1908', 'y1909', 'y1910', 'y1911', 'y1912'])
      @total_y1912_and_rf=BigDecimal(@projects.sum("y1912*pf").to_s)
    else
      @total_y1912_and_rf=BigDecimal(@projects.sum("y1912").to_s)
    end
    if @column_name.in?(['y1905','y1906','y1907','y1908', 'y1909', 'y1910', 'y1911', 'y1912', 'y1912'])
    @total_y2001_and_rf=BigDecimal(@projects.sum("y2001*pf").to_s)
    else
      @total_y2001_and_rf=BigDecimal(@projects.sum("y2001").to_s)
    end
    if @column_name.in?(['y1905','y1906','y1907','y1908', 'y1909', 'y1910', 'y1911', 'y1912', 'y2001', 'y2002'])
      @total_y2002_and_rf=BigDecimal(@projects.sum("y2002*pf").to_s)
    else
      @total_y2002_and_rf=BigDecimal(@projects.sum("y2002").to_s)
    end
    if @column_name.in?(['y1905','y1906','y1907','y1908', 'y1909', 'y1910', 'y1911', 'y1912', 'y2001', 'y2002', 'y2003' ])
      @total_y2003_and_rf=BigDecimal(@projects.sum("y2003*pf").to_s)
    else
      @total_y2003_and_rf=BigDecimal(@projects.sum("y2003").to_s)
    end

		@sum_projects_rf_month = @total_y1904_and_rf + @total_y1905_and_rf + @total_y1906_and_rf + @total_y1907_and_rf + @total_y1908_and_rf + @total_y1909_and_rf + @total_y1910_and_rf + @total_y1911_and_rf + @total_y1912_and_rf + @total_y2001_and_rf + @total_y2002_and_rf + @total_y2003_and_rf
		
		#状況を抽出
		# @progress=Project.all
		#@search_result = @projects_search.result
		
		# @chart_data=[['2018/01',@total_y1801],['2018/02',@total_y1802],['2018/03',@total_y1803],['2018/04',@total_y1804],['2018/05',@total_y1805],['2018/06',@total_y1806],['2018/07',@total_y1807],['2018/08',@total_y1808],['2018/09',@total_y1809],['2018/10',@total_y1810],['2018/11',@total_y1811],['2018/12', @total_y1812]]
		
		# gon.chart_data=@chart_data
		
			#input value	
			@cumulative_y1804=@total_y1804#@cumulative_y1803+@total_y1804
			@cumulative_y1805=@cumulative_y1804+@total_y1805
			@cumulative_y1806=@cumulative_y1805+@total_y1806
			@cumulative_y1807=@cumulative_y1806+@total_y1807
			@cumulative_y1808=@cumulative_y1807+@total_y1808
			@cumulative_y1809=@cumulative_y1808+@total_y1809
			@cumulative_y1810=@cumulative_y1809+@total_y1810
			@cumulative_y1811=@cumulative_y1810+@total_y1811
			@cumulative_y1812=@cumulative_y1811+@total_y1812
			@cumulative_y1901=@cumulative_y1812+@total_y1901
			@cumulative_y1902=@cumulative_y1901+@total_y1902
			@cumulative_y1903=@cumulative_y1902+@total_y1903
			@cumulative_y1904=@cumulative_y1903+@total_y1904
			@cumulative_y1905=@cumulative_y1904+@total_y1905
			@cumulative_y1906=@cumulative_y1905+@total_y1906
			@cumulative_y1907=@cumulative_y1906+@total_y1907
			@cumulative_y1908=@cumulative_y1907+@total_y1908
			@cumulative_y1909=@cumulative_y1908+@total_y1909
			@cumulative_y1910=@cumulative_y1909+@total_y1910
			@cumulative_y1911=@cumulative_y1910+@total_y1911
			@cumulative_y1912=@cumulative_y1911+@total_y1912
			@cumulative_y2001=@cumulative_y1912+@total_y2001
			@cumulative_y2002=@cumulative_y2001+@total_y2002
			@cumulative_y2003=@cumulative_y2002+@total_y2003
		
			#input value and risk_factor(=expected value)
			@cumulative_y1804_and_rf=@total_y1804_and_rf
			@cumulative_y1805_and_rf=@cumulative_y1804_and_rf+@total_y1805_and_rf
			@cumulative_y1806_and_rf=@cumulative_y1805_and_rf+@total_y1806_and_rf
			@cumulative_y1807_and_rf=@cumulative_y1806_and_rf+@total_y1807_and_rf
			@cumulative_y1808_and_rf=@cumulative_y1807_and_rf+@total_y1808_and_rf
			@cumulative_y1809_and_rf=@cumulative_y1808_and_rf+@total_y1809_and_rf
			@cumulative_y1810_and_rf=@cumulative_y1809_and_rf+@total_y1810_and_rf
			@cumulative_y1811_and_rf=@cumulative_y1810_and_rf+@total_y1811_and_rf
			@cumulative_y1812_and_rf=@cumulative_y1811_and_rf+@total_y1812_and_rf
			@cumulative_y1901_and_rf=@cumulative_y1812_and_rf+@total_y1901_and_rf
			@cumulative_y1902_and_rf=@cumulative_y1901_and_rf+@total_y1902_and_rf
			@cumulative_y1903_and_rf=@cumulative_y1902_and_rf+@total_y1903_and_rf
			@cumulative_y1904_and_rf=@cumulative_y1903_and_rf+@total_y1904_and_rf
			@cumulative_y1905_and_rf=@cumulative_y1904_and_rf+@total_y1905_and_rf
			@cumulative_y1906_and_rf=@cumulative_y1905_and_rf+@total_y1906_and_rf
			@cumulative_y1907_and_rf=@cumulative_y1906_and_rf+@total_y1907_and_rf
			@cumulative_y1908_and_rf=@cumulative_y1907_and_rf+@total_y1908_and_rf
			@cumulative_y1909_and_rf=@cumulative_y1908_and_rf+@total_y1909_and_rf
			@cumulative_y1910_and_rf=@cumulative_y1909_and_rf+@total_y1910_and_rf
			@cumulative_y1911_and_rf=@cumulative_y1910_and_rf+@total_y1911_and_rf
			@cumulative_y1912_and_rf=@cumulative_y1911_and_rf+@total_y1912_and_rf
			@cumulative_y2001_and_rf=@cumulative_y1912_and_rf+@total_y2001_and_rf
			@cumulative_y2002_and_rf=@cumulative_y2001_and_rf+@total_y2002_and_rf
			@cumulative_y2003_and_rf=@cumulative_y2002_and_rf+@total_y2003_and_rf

    end
    

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
      @project2 = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(
          :no, 
          :task, 
          :charge, 
          :company,
          :y1801,
          :y1802,
          :y1803,
          :y1804,
          :y1805,
          :y1806,
          :y1807,
          :y1808,
          :y1809,
          :y1810,
          :y1811,
          :y1812,
          :y1901,
          :y1902,
          :y1903,
          :y1904, 
          :y1905, 
          :y1906, 
          :y1907, 
          :y1908, 
          :y1909, 
          :y1910, 
          :y1911, 
          :y1912, 
          :y2001, 
          :y2002, 
          :y2003,
          :contract, 
          :start, 
          :end, 
          :inspe, 
          :insmonth, 
          :delivery, 
          :deliverymonth, 
          :deposit, 
          :depomonth, 
          :deposit2, 
          :depomonth2, 
          :deposittype,
          :team, 
          :tech, 
          :salestype, 
          :pf, 
          :level, 
          :pjprice, 
          :plancost, 
          :realcost, 
		      :remarks,
          :sum19,
          :sum19pf
          )
        
  end
  
  def project_params2
    params.require(:project).permit(
        :no, 
        :task, 
        :charge, 
        :company,
        :y1801,
        :y1802,
        :y1803,
        :y1804,
        :y1805,
        :y1806,
        :y1807,
        :y1808,
        :y1809,
        :y1810,
        :y1811,
        :y1812,
        :y1901,
        :y1902,
        :y1903,
        :y1904, 
        :y1905, 
        :y1906, 
        :y1907, 
        :y1908, 
        :y1909, 
        :y1910, 
        :y1911, 
        :y1912, 
        :y2001, 
        :y2002, 
        :y2003,
        :contract, 
        :start, 
        :end, 
        :inspe, 
        :insmonth, 
        :delivery, 
        :deliverymonth, 
        :deposit, 
        :depomonth, 
        :deposit2, 
        :depomonth2, 
        :deposittype,
        :team, 
        :tech, 
        :salestype, 
        :pf, 
         
        :pjprice, 
        :plancost, 
        :realcost, 
    :remarks,
    :sum19,
    :sum19pf
    )
      
end

	# def projects_path_with_search_params
  #   	URI(request.referer).path == '/projects' ? @prev_q : projects_path
  # end
	  
	# def set_prev_search_params
	# 	@prev_q = URI(request.referer).query
	# 	# prev_params = Rack::Utils.parse_nested_query(prev_q)
	# 	# params[:q] = prev_params['q']
  # end
  
  # def projects_path_with_search_params
  #   # @prev_q = URI(request.referer).query
  #   if @prev_q != nil
	# 	prev_params = Rack::Utils.parse_nested_query(@prev_q)
  #   params[:q] = prev_params['q']
  #   end
  # end

  # def projects_path_with_search_params_action
  #   URI(request.referer).path == '/projects' ? @prev_q : projects_path
  # end
  

	
	   

end