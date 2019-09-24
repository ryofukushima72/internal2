module RecordtimeHelper
    def transfer_wday(date)
        if Time.parse(date).workday?
        else
            if Time.parse(date).wday == 6
                return "sat"
            elsif Time.parse(date).wday == 0
                return "sun"
            else
                return "hol"
            end            
        end
    end
end
