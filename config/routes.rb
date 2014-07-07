Erbv2::Application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'

  resources :users
  resources :companies, path: 'our-customers' do
    member { get :snippet }
  end
  resources :posts, path: :news, defaults: { format: 'html' }
  resources :feeds
  resources :categories
  resources :boxes do
    collection { post :import }
    resources :unique_numbers, path: 'uin' do
      resources :locations
    end
  end
  resources :quotes, only: [:create]
  resources :orders
  resources :order_details
  resources :trips
  resources :sessions, only: [:new, :create, :destroy]
  resources :mailings, only: [:create, :index]
  resources :password_resets

  root                              to: 'pages#home'
  match '/company-profile',         to: 'pages#company-profile', as: :about
  match '/contact',                 to: 'pages#contact'
  match '/what-people-are-saying',  to: 'pages#testimonials', as: :testimonials
  match '/reusable-boxes',          to: 'pages#reusable-boxes', as: :reuse
  match '/methodology',             to: 'pages#methodology', as: :restore
  match '/sustainability',          to: 'pages#sustainability', as: :rethink
  match '/privacy',                 to: 'pages#privacy'
  match '/software',                to: 'pages#software'
  match '/use',                     to: 'pages#terms-of-use'
  match '/shipping-containers',     to: 'pages#shipping-containers', as: :shipping
  match '/tape',                    to: 'pages#tape'
  match '/signup',                  to: 'users#new'
  match '/signin',                  to: 'sessions#new'
  match '/signout',                 to: 'sessions#destroy', via: :delete
  match '/resources',               to: 'pages#resources'
  match '/savings',                 to: 'pages#cost-savings'
  match '/update-feed',             to: 'posts#feed', as: :update_feed
  match '/track',                   to: 'boxes#track', as: :track_box
  match '/erb',                     to: 'companies#erb'
  match '/calc',                    to: 'boxes#calc'
  match '/box-detail',              to: 'boxes#detail', as: :box_detail
  match '/import-locations',        to: 'locations#import', as: :import_locations

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
