#InitialRelease::Application.routes.draw do
InitialRelease::Application.routes.draw do

  mount Ckeditor::Engine => "/ckeditor"

  root :to => "homes#index"
  get 'about' => "homes#show", :id=>'1', :as => 'about'
  get 'program' => "homes#show", :id=>'2', :as => 'program'
  get 'project_tomorrow' => "homes#show", :id=>'3', :as => 'project_tomorrow'
  get 'actions' => "homes#show", :id=>'4', :as => 'actions'
  get 'kalend' => "homes#show", :id=>'5', :as => 'kalend'
  get 'kalend_date/:id' => "homes#kalend", :as => 'kalend_date'
  get 'all_pages/:id' => "homes#all", :as => 'all_pages'
  get 'rss' => "homes#rss", :as => 'rss'
  get 'show/:id' => "homes#show", :as => 'show'
    
  get 'admin' => "authentifications#index"
  post 'login' => "authentifications#login"
  get 'logout' => "authentifications#logout", :as=>'logout'
  
  get 'language' => "homes#language", :as=>'language'
  
  get 'list' => "homes#list", :as=>'list'
  get 'new_pages/:id' => "homes#new", :as=>'new_pages'
  post 'create_pages' => "homes#create", :as=>'create_pages'
  get 'destroy_page/:id' => "homes#destroy", as: 'destroy_page'
  get 'edit_pages' => "homes#edit", :as=>'edit_pages'
  post 'update_pages' => "homes#update", :as=>'update_pages'
    
  resources :subscribes
  resources :pokazs

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
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
