class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :current_client

  private

  def current_client
    
    @current_client ||= Client.find(session[:client_id]) if session[:client_id] 
    
  end
  
  
  
end
