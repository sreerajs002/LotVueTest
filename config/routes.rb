Rails.application.routes.draw do
  get 'users/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/roles' => 'roles#index'
  get 'roles/new' => 'roles#new'
  post '/roles' => 'roles#create'
  post '/roles/update_status' => 'roles#update_status'
  
  get '/users/new' => 'users#new'
  post '/users' => 'users#create'
  get '/users' => 'users#index'
  root  to: 'roles#index'
end
