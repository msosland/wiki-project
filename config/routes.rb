Rails.application.routes.draw do


  resources :categories, only: [:index, :show] do
    resources :articles, only: [:new, :create]
  end

  resources :articles, only: [:index, :destroy, :show, :edit] do
    resources :versions
  end

  resources :users

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  post 'articles/:id/remove_featured' => 'articles#remove_featured', as: 'remove_featured'
  post 'articles/:id/make_featured' => 'articles#make_featured', as: 'make_featured'

  post 'articles/:id/publish' => 'articles#publish', as: 'publish'
  post 'articles/:id/unpublish' => 'articles#unpublish', as: 'unpublish'
  post 'articles/:id/needs_sources' => 'articles#needs_sources', as: 'needs_sources'
  post 'articles/:id/remove_needs_sources' => 'articles#remove_needs_sources', as: 'remove_needs_sources'


  root 'categories#index'


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
