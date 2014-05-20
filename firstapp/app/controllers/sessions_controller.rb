class SessionsController < ApplicationController
  def new
  end
  
  #############
  def create
  
   client = Client.authenticate(params[:email], params[:password])
  
   if client
     
      # to set on session 
      session[:client_id] = client.id
      session[:client_email] = client.email

     # redirect_to root_url, :notice => "Logged in!"
      redirect_to "/hotels/", :notice => "Logged in!"
      
  else
    flash.now.alert = "Invalid email or password"
    render "new"
  end
end

  ###################

def destroy
  
  session[:client_id] = nil
  
  redirect_to root_url, :notice => "Logged out!"
end

#########################  
end
