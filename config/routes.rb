Rails.application.routes.draw do
  get 'login', to: 'sessions#new', as: 'login_user'

  get 'registerUser', to: 'users#register_user'
  post 'registerUser', to: 'users#create_register_user'
  get 'register_users', to: 'users#index_register_users'



  get 'show_register_user', to: 'users#show_register_users', as: 'show_register_user'
  get 'edit_register_user/:id', to: 'users#edit_register_user', as: 'edit_register_user'
  put 'update_register_user/:id/edit', to: 'users#update_register_users', as: 'update_register_users'


  ##SESSIONS ROUTES
  get    'sign_in'   => 'users#new'
  post   'sign_in'   => 'sessions#create'
  delete 'sign_out'  => 'sessions#destroy'

  get 'admin/index'

  get 'home/index'

  #root 'sessions#new'
  root 'home#index'

  resources :ads
  #resources :accounts
  #resources :account_resources
  #resources :rates
  #resources :ad_images
  #resources :images
  #resources :user_phones
  resources :users
  #resources :resources
  #resources :account_kinds
  #resources :countries
  #resources :states
  #resources :cities
  #resources :addresses
  #resources :phones
  #resources :operators
  #resources :professions
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
