Rails.application.routes.draw do

  get '/admission_officers/login_form' => 'admission_officers#login_form'
  post '/admission_officers/login' => 'admission_officers#login'

<<<<<<< HEAD
  # get '/admission_officers/student/:id' => 'admission_officers#show'
# I want to send the admissions officer to a route similar to the above. To display student information as seen is the show.

  resources :admission_officers, :instructors do 
    resources :students
  end
=======
  get '/students/login_form' => 'students#login_form'
  post '/students/login' => 'students#login'

>>>>>>> efc1ef10097ecea25eb980aaaa42e88b475dc731

  resources :students

  resources :ao_questionnaires
  resources :instructor_questionnaires

  root :controller => 'static', :action => '/'
<<<<<<< HEAD
=======

>>>>>>> efc1ef10097ecea25eb980aaaa42e88b475dc731
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
