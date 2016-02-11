Rails.application.routes.draw do

<<<<<<< HEAD
  get '/admissions_officers/login_form' => 'admissions_officers#login_form'
=======

  

  

  get '/admissions_officers' => 'admissions_officers#index'
  get '/admissions_officers/login' => 'admissions_officers#login'
>>>>>>> 4171fe6e62bdf2762adf0a0171a4176a6910847b
  post '/admissions_officers/login' => 'admissions_officers#login'


  resources :students
  resources :instructors
  resources :ao_questionnaires
  resources :instructors_questionnaires
  resources :admissions_officers

  root :controller => 'static', :action => '/'
  post '/login' => 'students#login'
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
