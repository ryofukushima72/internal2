
ENV['TZ'] = 'Asia/Tokyo'

class RecordtimeController < ApplicationController
    before_action :authenticate_user!

    def index
        @user = User.find(current_user.id)
        @recordstate = Recordstate.all
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

        @dstart = dstart
        @dend = dend
        work_count = 0
        @date.each do |d|
          if d.workday?
            work_count = work_count + 1
          end
        end
        @work_count = work_count 

        recordtime = Recordtime.where(user_id: current_user.id)
        recordtime = recordtime.where("rt >= ?", dstart )
        recordtime = recordtime.where("rt <= ?", dend )
        
        @recordtime = recordtime.select('recordstate_id', 'rt', 'commit', 'julianday(rt) as rt_juli', 'night', 'begin', 'julianday(begin) as begin_juli')

        nighttime = recordtime.where(night: 1)
        nighttime = nighttime.select('recordstate_id', 'rt', 'commit', 'julianday(rt) as rt_juli', 'night')
        @nighttime = nighttime
  
    end

    def recordedit
      @user = User.find(current_user.id)
      @recordtime = Recordtime.find(params[:id])
    end

    def recordupdate
      @recordtime = Recordtime.find(params[:id])

      rt = Time.zone.local(params[:recordtime]["rt(1i)"].to_i, 
                        params[:recordtime]["rt(2i)"].to_i, 
                        params[:recordtime]["rt(3i)"].to_i, 
                        params[:recordtime]["rt(4i)"].to_i, 
                        params[:recordtime]["rt(5i)"].to_i)
     
      if rt.strftime('%Y-%m-%d') != @recordtime.rt.strftime('%Y-%m-%d')
        redirect_back(fallback_location: root_path, notice: '打刻修正失敗(日付変更はできません)')
        return
      end

      if rt.strftime('%H%M') > '2200'
        @recordtime.night = 1
      else
        @recordtime.night = 0
      end
      
      begintime =Time.zone.local(rt.strftime('%Y'), rt.strftime('%m'), rt.strftime('%d'), 22, 00)
      
      puts begintime
      @recordtime.rt = rt
      @recordtime.begin = begintime
      @recordtime.commit = 0

      if @recordtime.save
        redirect_back(fallback_location: recordtime_path, notice: '打刻修正成功')
      else
        redirect_back(fallback_location: recordtime_path, notice: '打刻修正失敗')
      end

    end

    def edit
      @user = User.find(current_user.id)
      @recordstate = Recordstate.all
      @date = Time.zone.parse(params[:date])
      
      recordtime = Recordtime.where(user_id: current_user.id)
      recordtime = recordtime.where('rt >= ?', @date.beginning_of_day )
      recordtime = recordtime.where('rt <= ?', @date.end_of_day )
      @recordtime = recordtime

    end

    def recordcreate
      @user = User.find(current_user.id)
      
      recordtime = Recordtime.where(user_id: current_user.id)
      @date = Time.zone.parse(params[:date])
      
      recordtime = recordtime.where('rt >= ?', @date.beginning_of_day )
      recordtime = recordtime.where('rt <= ?', @date.end_of_day )
      record1 = recordtime.where(recordstate_id: '1')#出勤
      record2 = recordtime.where(recordstate_id: '2')#退勤

      if params[:recordstate_id] == '1'#出勤
        if record1.present?
          redirect_back(fallback_location: root_path, notice: '追加失敗(出勤重複)')
          return
        end
      elsif params[:recordstate_id] == '2'#退勤
        if record2.present?
          redirect_back(fallback_location: root_path, notice: '追加失敗(退勤重複)')
          return
        end
      end

      rt1 = params[:date]
      rt2 = params[:time]
      rt = rt1+' '+rt2
      rt = Time.zone.parse(rt)

      begintime =Time.zone.local(rt.strftime('%Y'), rt.strftime('%m'), rt.strftime('%d'), 22, 00)
      
      @recordtime = Recordtime.create(user_id: params[:user_id],
                                      rt: rt,
                                      recordstate_id: params[:recordstate_id],
                                      commit: 0,
                                      begin: begintime)


      if rt.strftime('%H%M') > '2200'
        @recordtime.night = 1
      else
        @recordtime.night = 0
      end

      if @recordtime.save
        redirect_back(fallback_location: root_path, notice: '打刻登録成功')
      else
        redirect_back(fallback_location: root_path, notice: '打刻登録失敗')
      end
      
    end

    def create
      
      @user = User.find(current_user.id)

      recordtime = Recordtime.where(user_id: current_user.id)
      @date = Time.zone.parse(params[:date])
      recordtime = recordtime.where('rt >= ?', @date.beginning_of_day )
      recordtime = recordtime.where('rt <= ?', @date.end_of_day )
      record1 = recordtime.where(recordstate_id: '1')#出勤
      record2 = recordtime.where(recordstate_id: '2')#退勤

      if params[:recordstate_id] == '1'#出勤
        if record1.present?
          redirect_back(fallback_location: root_path, notice: '追加失敗(出勤重複)')
          return
        end
      elsif params[:recordstate_id] == '2'#退勤
        if record2.present?
          redirect_back(fallback_location: root_path, notice: '追加失敗(退勤重複)')
          return
        end
      end

      time = Time.zone.now.strftime("%Y-%m-%d %H:%M:%S")
      if Time.zone.now.strftime('%H%M') > '2200'
        night = 1
      else
        night = 0
      end

      rt1 = params[:date]
      rt2 = params[:time]
      rt = rt1+' '+rt2
      rt = Time.parse(rt)

      begintime =Time.zone.local(rt.strftime('%Y'), rt.strftime('%m'), rt.strftime('%d'), 22, 00)

      @recordtime = Recordtime.create(user_id: params[:user_id],
                                      rt: time,
                                      recordstate_id: params[:recordstate_id],
                                      night: night)

      @recordtime.begin = begintime

      if @recordtime.save
        redirect_back(fallback_location: root_path, notice: '打刻登録成功')
      else
        redirect_back(fallback_location: root_path, notice: '打刻登録失敗')
      end

    end


    def useredit
        @user = User.find(current_user.id)
    end

    def userupdate
        @user = User.find(current_user.id)
        if @user.update(user_params)
            redirect_to recordtime_path, notice: "ユーザー情報更新完了"
        else
            redirect_to recordtime_path, notice: "ユーザー情報更新失敗"
        end
    end

    private

    def user_params
        params.require(:user).permit(:fname, :gname, :usercode)
    end

    

end
