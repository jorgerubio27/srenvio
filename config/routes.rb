Rails.application.routes.draw do
  # root 'home#index'
  root 'sessions#new'
  
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'dinning', to: 'dinning#index', as: 'dinning'
  get 'menutoday', to: 'dinning#today', as: 'menutoday'
  get 'request', to: 'dinning#frequest', as: 'frequest'

  

  get 'dinning/index'
  get 'dinning/today'
  get 'dinning/check'
  get 'dinning/frequest'
  get 'home/index'
end