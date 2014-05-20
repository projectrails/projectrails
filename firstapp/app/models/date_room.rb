class DateRoom < ActiveRecord::Base
  
    belongs_to :room, :class_name => "Room",
    :foreign_key => "id"
  
  
end
