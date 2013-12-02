Erbv2::Application.routes.draw do
  
  mount Ckeditor::Engine => '/ckeditor'

  resources :users
  resources :companies do
    member do
      get 'snippet'
    end
  end
  resources :posts, path: :news, defaults: { format: 'html' }
  resources :feeds
  resources :categories
  resources :boxes do
    collection { post :import }
  end
  resources :orders
  resources :order_details
  resources :trips
  resources :sessions,    only: [:new, :create, :destroy]
  resources :mailings,    only: [:create, :index]
  resources :password_resets

  root                              to: 'pages#home'
  match '/company-profile',         to: 'pages#company-profile', as: :about
  match '/contact',                 to: 'pages#contact'
  match '/what-people-are-saying',  to: 'pages#testimonials', as: :testimonials
  match '/reuse',                   to: 'pages#reusable-boxes'
  match '/restore',                 to: 'pages#methodology'
  match '/rethink',                 to: 'pages#reclamation'
  match '/privacy',                 to: 'pages#privacy'
  match '/software',                to: 'pages#software'
  match '/use',                     to: 'pages#terms-of-use'
  match '/shipping',                to: 'pages#shipping-containers'
  match '/signup',                  to: 'users#new'
  match '/signin',                  to: 'sessions#new'
  match '/signout',                 to: 'sessions#destroy', via: :delete
  match '/resources',               to: 'pages#resources'
  match '/savings',                 to: 'pages#cost-savings'
  match '/update-feed',             to: 'posts#feed', as: :update_feed
  match '/track',                   to: 'boxes#track', as: :track_box
  match '/erb',                     to: 'companies#erb'

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
end
