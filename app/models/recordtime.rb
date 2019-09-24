class Recordtime < ActiveRecord::Base
    belongs_to :recordstate
    belongs_to :user
end
