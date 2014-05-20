class Hotel < ActiveRecord::Base
  
  has_many :review
  has_many :room
  
end
