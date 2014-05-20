Firstapp::Application.routes.draw do
  
  get "dates/new"

  get "rooms/new"

  get "reviews/new"

  #get "hotels/new"

  #get "sessions/new"

  #get "clients/new"

  get "pages/home"

  get "pages/contact"

	#match '/about' , :to => 'pages#about'

  resources :posts

  resources :users
 
 # get mean ==== if method get from url 
 # post mean === if method post from (any submit form ) 
 
 ####### to make routes of sign up ########
  get "sign_up" => "clients#new",:as => "sign_up"
  #get "index" => "clients#index",:as => "index"
  
  root :to => "clients#new"
  resources :clients
  
  ####### to make routes of sign in  & log out########
  controller :sessions do
    get "log_in" => "sessions#new", :as => "log_in"
    post "log_in" => "sessions#create", :as => "log_in"
    get "log_out" => "sessions#destroy", :as => "log_out"
    
    root :to => "hotels#index"
  end
  resources :sessions
   ####### to make routes of hotels########
  
    get "list_hotels" => "hotels#index",:as => "list_hotels"
    get "show_gallery" => "hotels#show",:as => "show_gallery"
    
    root :to => "hotels#index"
    resources :hotels
   ####### to make routes of reviews########
   get "reviews" => "reviews#index",:as => "reviews"
   get "new" => "reviews#new",:as => "new"
   post"new" => "reviews#create" , :as => "new"
  
  
   root :to => "reviews#index"
   resources :reviews
   ####### to make routes of check########
  get "rooms" => "rooms#index",:as => "rooms"
  get "check" => "rooms#check",:as => "check"
  
  get "search" => "rooms#index",:as => "search"
  post "search" => "rooms#search",:as => "search"
  
  get "reserve" => "rooms#reserve",:as => "reserve"
  get "welcome" => "rooms#welcome",:as => "welcome"
  
  
  root :to => "rooms#index"
  resources :check
  ################################################
 end   

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'

