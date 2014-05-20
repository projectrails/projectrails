class Review < ActiveRecord::Base
  
  belongs_to :hotel, :class_name => "Hotel",
    :foreign_key => "id"

end #end of class
