class Room < ActiveRecord::Base
  
    belongs_to :hotel, :class_name => "Hotel",
    :foreign_key => "id"
  
  
end
