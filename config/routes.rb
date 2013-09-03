Mpg::Application.routes.draw do
  resources :cars
  resources :tanks
  resources :users
  resources :reset

  # Registration
  get  'passwords/:code' => "passwords#new", as: :register
  post 'passwords/:code' => "passwords#create"
  
  # Password reset
  # get   'reset/:code' => "reset#edit", as: :reset
  # put   'reset/:code' => "reset#update"
  # patch 'reset/:code' => "reset#update"
  
  # Login
  get    'login' => "sessions#new", as: :login
  post   'login' => "sessions#create"

  root 'sessions#index'

  get    'logout' => "sessions#destroy", as: :logout
  delete 'logout' => "sessions#destroy"

end
