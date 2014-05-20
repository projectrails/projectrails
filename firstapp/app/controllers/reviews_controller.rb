class ReviewsController < ApplicationController

  # class varailble
  
    @@hotel_id=0
   
  ################
  # GET /users/1
  # GET /users/1.json
  def index
 
    @@hotel_id=params[:hotel_id]
    
    @reviews = Review.where(:myreview_id=>params[:hotel_id])
   

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @reviews}
    end
  end
  ##############################################
    def new
      # to make form
      @review = Review.new()
      
      #@@hotel_id=params[:hotel_id]
      
    #comment = Comment.new(comment_params)
    #comment.article_id = params[:id]
    #comment.save
      
    
     respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @review}
    end
  
  end
  
  
  ####################################################
   def create
    
     #to get from session
    @current_client ||= Client.find(session[:client_id]) if session[:client_id]  
     
    @review = Review.new(params[:review])
    # from url
    @review.myreview_id = @@hotel_id
    #to get from session
    @review.myreview_user = @current_client.email
     
    #@review.save
    if @review.save
    
      redirect_to "/hotels/"
    else
      render "new"
    end
   

  end #of def
    
    
####################################################  
    

  
  
#########################################################
end
