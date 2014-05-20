class User < ActiveRecord::Base

	has_many :posts

	has_many :posts

	validates :email, :presence => true

end
