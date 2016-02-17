Rails.application.routes.draw do

  get '/admission_officers/login_form' => 'admission_officers#login_form'
  post '/admission_officers/login' => 'admission_officers#login'
  post '/create' => 'admission_officers#create'

  # get '/admission_officers/logout' => 'admission_officers#logout'
  # post '/admission_officers/logout' => 'admission_officers#logout'

  get '/instructors/login_form' => 'instructors#login_form'
  post '/instructors/login' => 'instructors#login'

  # get '/instructors/logout' => 'instructors#logout'
  # post '/instructors/logout' => 'instructors#logout'

  get '/logout' => 'application#logout'
  post '/logout' => 'application#logout'

  resources :admission_officers, :instructors do 
    resources :students
  end

  get '/students/login_form' => 'students#login_form'
  post '/students/login' => 'students#login'


  get '/students/new' => 'students#new'
  post '/students/create' => 'students#create'

  # get '/students/logout' => 'students#logout'
  # post '/students/logout' => 'students#logout'

  resources :students do
    resources :ao_questionnaires, :instructor_questionnaires
  end

  get '/students/logout' => 'students#logout'
  post '/students/logout' => 'students#logout'

  resources :students
  resources :ao_questionnaires
  resources :instructor_questionnaires

  root :controller => 'static', :action => '/'


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
