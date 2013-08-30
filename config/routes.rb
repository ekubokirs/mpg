Mpg::Application.routes.draw do
  resources :cars
  resources :tanks
  resources :users
  resources	:passwords

  # Registration
  get  'passwords/:code' => "password#new", as: :register
  post 'passwords/:code' => "password#create"
  
  # Password reset
  get   'reset/:code' => "password#edit", as: :reset
  put   'reset/:code' => "password#update"
  patch 'reset/:code' => "password#update"
  
  # Login
  get    'login' => "sessions#new", as: :login
  post   'login' => "sessions#create"

  root 'sessions#index'

  get    'logout' => "sessions#destroy", as: :logout
  delete 'logout' => "sessions#destroy"

end
