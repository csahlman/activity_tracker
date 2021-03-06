Rails4bootstrap3backbone::Application.routes.draw do
  root to: 'pages#home'

  resources :users, only: [ :new, :create ]

  resources :cities, only: [ :index, :show ]

  get '/account_confirmations', to: 'account_confirmations#create', as: 'account_confirmations'

  resource :resend_confirmation, only: [ :new, :create ]
  resource :password_reset, only: [ :new, :create, :edit, :update ]

  controller :sessions do 
    get 'sign_in' => :new
    post 'sign_in' => :create
    delete 'sign_out' => :destroy
  end

  namespace :forums do 
    root to: 'forums#index'
  end

  namespace :api do 
    get '/get_form_data', to: 'form_datas#show'
    put '/save_data', to: 'form_datas#update'
  end

  # resource :account_confirmations, only: [ :create ]

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
