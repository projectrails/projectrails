class HotelsController < ApplicationController
  def new
  end
  
  def index
    
    # to select * from DB
    @hotels = Hotel.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @hotels }
    end

  end
################################################
# GET /users/1
  # GET /users/1.json
  def show
    
    @hotel = Hotel.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @hotel }
    end
  end
  
#######################################################


############################################ 
end  #of class
