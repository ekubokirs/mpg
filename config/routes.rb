Mpg::Application.routes.draw do
  resources :cars
  resources :tanks
  resources :users

  get'cars/:id/stats' => "cars#stats"

  # Registration
  get  'passwords/:code' => "passwords#new", as: :register
  post 'passwords/:code' => "passwords#create"
  get  'passwords/:code/edit' => "passwords#edit", as: :reset
  put  'passwords/:code/edit' => "passwords#update"
  
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
