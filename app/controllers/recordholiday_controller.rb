class RecordholidayController < ApplicationController
    before_action :authenticate_user!

    def index
        @user = User.find(current_user.id)

        @time = Time.zone.now

        if params[:month].present?
            date = params[:month]
            date = date+'-01'
            date = Date.parse(date)
            dstart = (date.beginning_of_month)
            dend = (date.end_of_month)
            @date = (dstart..dend).map.uniq

        elsif params[:month1].present? and params[:month2].present?
            puts params[:month1]
            date1 = params[:month1]
            date1 = Date.parse(date1)
            dstart = date1
            date2 = params[:month2]
            date2 = Date.parse(date2)
            dend = date2
            @date = (dstart..dend).map.uniq

        else
            date = Date.today
            dstart = (date.beginning_of_month)
            dend = (date.end_of_month)
            @date = (dstart..dend).map.uniq

        end

        recordholiday = Recordholiday.where(user_id: current_user.id)
        recordholiday = recordholiday.where("rh >= ?", dstart )
        recordholiday = recordholiday.where("rh <= ?", dend )

        @recordholiday = recordholiday

        recordholidays = Recordholiday.where(user_id: current_user.id)
        @recordholidays = recordholidays.where(commit: false)
        
        alt = 0
        paid = 0
        if @recordholidays.present? 
          @recordholidays.each do |t|
            if t.alt == true
              if t.half?
                alt = alt + 0.5
              else
                alt = alt + 1
              end
            else
              if t.half?
                paid = paid + 0.5
              else
                paid = paid + 1
              end
            end
          end
        end
        @alt = alt
        @paid = paid


    end

    def new
      @user = User.find(current_user.id)

    end

    def create
      @user = User.find(current_user.id)
      
      @recordholiday = Recordholiday.create(user_id: current_user.id, rh: params[:rh], alt: params[:alt], half: params[:half])

      respond_to do |format|
        if @recordholiday.save
          format.html { redirect_to recordholiday_path, notice: '申請成功' }
          format.json { render :show, status: :created, location: @recordholiday }
        else
          format.html { redirect_to recordholiday_path, notice: '申請失敗' }
          format.json { render json: @recordholiday.errors, status: :unprocessable_entity }
        end
      end

    end

end
