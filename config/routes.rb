Shop2::Application.routes.draw do

  devise_for :users
  resources :categories, only: [:index, :show]
  resources :items, only: [:index, :show]
  resources :comments, :only => [:create, :destroy]
  resources :item_users, only: [:index, :create, :destroy]
  resources :orders, only: [:index, :create]

  # Админка
  namespace :admin do
    get '/' => 'index#index'                  # V
    resources :categories, except: [:show]
    resources :items, except: [:show]
    resources :users, only: [:index]          # V
    resources :orders, only: [:index]         # V
  end

  get 'robokassa/success'
  get 'robokassa/fail'
  post 'robokassa/paid'

  #scope 'robokassa' do
  #  post 'paid'    => 'robokassa#paid',    :as => :robokassa_paid # to handle Robokassa push request
  #  get 'success' => 'robokassa#success', :as => :robokassa_success # to handle Robokassa success redirect
  #  get 'fail'    => 'robokassa#fail',    :as => :robokassa_fail # to handle Robokassa fail redirect
  #end

  get 'profile/show'
  get 'profile/edit'
  put 'profile/save'

  get 'legal/terms'
  get 'legal/privacy'

  get 'about' => 'pages#about'
  get 'team' => 'pages#team'
  get 'contacts' => 'pages#contacts'


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
  root :to => 'home#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
