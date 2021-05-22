Rails.application.routes.draw do
  # get 'student/index'
  get '/student', to: 'student#index'
  post '/student',   to: 'student#show'
  put '/enrolls/1', to: 'enrolls#deenrollment'
  put '/enrolls/0',   to: 'enrolls#enrollment'
  put '/enrolls/course',   to: 'enrolls#studentEnroll'
  put '/enrolls/student',   to: 'enrolls#courseEnroll'
  resources :enrolls
  resources :courses
  mount_devise_token_auth_for 'User', at: 'auth'
  # match '/student',     to: 'users#sindex',       via: 'get'
  # match '/student',     to: 'users#shoe',       via: 'post'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
