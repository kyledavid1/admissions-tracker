Rails.application.routes.draw do

  get '/admission_officers/login_form' => 'admission_officers#login_form'
  post '/admission_officers/login' => 'admission_officers#login'

  # get '/admission_officers/student/:id' => 'admission_officers#show'
# I want to send the admissions officer to a route similar to the above. To display student information as seen is the show.

  resources :admission_officers, :instructors do 
    resources :students
  end

  resources :students

  resources :ao_questionnaires
  resources :instructor_questionnaires

  root :controller => 'static', :action => '/'
  post '/login' => 'students#login'
  
end
