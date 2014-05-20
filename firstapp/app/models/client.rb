class Client < ActiveRecord::Base

  
  attr_accessible :email, :password, :password_confirmation
  
  attr_accessor :password
  before_save :encrypt_password
  
  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email
  
  
  ############# class method
  def self.authenticate(email, password)
    client = find_by_email(email)
    
    if client && client.password_hash == BCrypt::Engine.hash_secret(password, client.password_salt)
     ## return user
      client
    else
      ## return null
      nil
    end
  end
  #############################
  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
  


end
