Rails.application.routes.draw do
  # root 'home#index'
  root 'home#index'
  
  resources :users
  resources :upload
  resources :sessions, only: [:new, :create, :destroy]
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'dinning', to: 'dinning#index', as: 'dinning'
  get 'menutoday', to: 'dinning#today', as: 'menutoday'
  get 'frequest', to: 'dinning#frequest', as: 'frequest'
  get 'rules', to: 'info#rules', as: 'rules'


  get '/users/:id/passwordchange', to:'users#passwordchange', as: 'passwordchange'
  get 'usersettings/passwordchange'




  
  get '/users/:id/foodreq', to:'users#foodreq', as: 'foodreq'
  post '/users/:id/foodreq' => 'users#foodreq' 
  # , to: 'patients#show'
  

  get 'dinning/index'
  get 'dinning/today'
  get 'dinning/check'
  get 'dinning/frequest'
  get 'home/index'
end