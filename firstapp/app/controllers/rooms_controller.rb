class RoomsController < ApplicationController
  
    # class varailble
  
    @@hotel_id=0
  
  
  def new
  end
  ###########################
  
  def index
  # GET /users/1
  # GET /users/1.json
  
  #from url
    
    @@hotel_id=params[:hotel_id]
    
    @info_rooms=Room.where(:hotel_id_id => params[:hotel_id])
   

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json:@info_rooms}
    end
  end
  ########################################
  def check
    
    @@room_id=params[:room_id]
    
       respond_to do |format|
      format.html # check.html.erb
      format.json { render json:@info_rooms}
    end
    
    
  end
  
  ########################################
  
  def search
    
  
    @@busy_start_post = params[:busy_start]
    @@busy_end_post = params[:busy_end]
    
    #Client.where(:created_at => (params[:start_date].to_date)..(params[:end_date].to_date))
    #SELECT "clients".* FROM "clients" WHERE ("clients"."created_at" BETWEEN '2010-09-29' AND '2010-11-30')
    #
    #Client.joins('LEFT OUTER JOIN addresses ON addresses.client_id = clients.id')
    #SELECT clients.* FROM clients LEFT OUTER JOIN addresses ON addresses.client_id = clients.id

    @info_date=DateRoom.where(:busy_start => (params[:busy_start].to_date)..(params[:busy_start].to_date),
    
                            :busy_end => (params[:busy_start].to_date)..(params[:busy_start].to_date),
                            :room_id_id  => params[:room_id]
                            )
    render"reserve"
   
    
  end
  ####################################################
  def reserve
    
       #to get from session
    @current_client ||= Client.find(session[:client_id]) if session[:client_id]  
    
    
    @record = DateRoom.new()
      #to get from session
    @record.reserve_user = @current_client.email
    
    @record.room_id_id= @@room_id
    @record.busy_start= @@busy_start_post 
    @record.busy_end= @@busy_end_post
    
    
    if @record.save
    
      render "welcome"
    #else
     # render "reserve"
    end
    
   
  end
  
  ###############################################
  def welcome
    
      respond_to do |format|
      format.html # welcome.html.erb
      #format.json { render json:@info_date}
    end
    
    
  end
  
  
  
  
  ##################################
end  #end of class
