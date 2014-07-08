Rails.application.routes.draw do

  get 'sessions/new'
  
  resources :users
  resources :posts
  
  get 'login' => 'sessions#new'
   
  post 'sessions' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'


  root 'users#index'
end
