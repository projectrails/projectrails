class ClientsController < ApplicationController

  def index
  
     respond_to do |format|
      format.html # index.html.erb
      #format.json { render json:@info_rooms}
    end
    
  end
  ##########################
  
  def new
      @client = Client.new
  end
  
###############################################  
  def create
    
    @client = Client.new(params[:client])
    
    if @client.save
      
      redirect_to root_url, :notice => "Signed up!"
    else
      render "new"
    end

  end #of def
###############################################  
  
end
