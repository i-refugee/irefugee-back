Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  resources :centers, :only => [:create, :index, :destroy, :show, :update] do
    resources :statuses, :only => [:index, :show,:create,:destroy,:update], shallow: true
    resources :center_needs, :only => [:index, :create, :destroy,:show,:update], shallow: true
    resources :keywords, :only => [:index]
    resources :center_keywords, :only => [:index]
  end

  resources :statuses, :only => [:create]
  resources :center_keywords, :only => [:create, :show, :destroy]

  get 'test' => 'needs#test'
  post 'password_change' => 'centers#password_change'

  get 'stream' => 'application#stream'

  post 'centers/:id/upload' => 'centers#upload'
  resources :admin, :only => [:create, :index, :show, :destroy]
  resources :sessions, :only => [:create]
  post 'sessions/revoke' => 'sessions#destroy'
  resources :admin_session, :only => [:create,:destroy]
  resources :needs, :only => [:index, :show,:create, :destroy,:update]
  resources :keywords, :only => [:index, :create, :show, :destroy]
  resources :newsfeeds, :only => [:index]
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
