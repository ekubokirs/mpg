Mpg::Application.routes.draw do
  resources :cars
  resources :tanks
  resources :users

  # Registration
  get  'passwords/:code' => "passwords#new", as: :register
  post 'passwords/:code' => "passwords#create"
  
  # Password reset
  get   'passwords/:code' => "passwords#edit", as: :reset
  put   'passwords/:code' => "passwords#update"
  patch 'passwords/:code' => "passwords#update"
  
  # Login
  get    'login' => "sessions#new", as: :login
  post   'login' => "sessions#create"

  root 'sessions#index'

  get    'logout' => "sessions#destroy", as: :logout
  delete 'logout' => "sessions#destroy"

end
