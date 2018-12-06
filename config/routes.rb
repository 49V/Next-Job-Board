Rails.application.routes.draw do

  get 'sessions/new'

  root 'static_pages#home'
  get '/account',    to: 'static_pages#account'
  get '/candidates', to: 'static_pages#candidates'
  get '/jobs',       to: 'static_pages#jobs'
  get '/users',      to: 'users#signup'
  get '/index',      to: 'users#index'
  get '/login',      to: 'sessions#new'
  post '/login',     to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users
  resources :account_activations, only: [:edit]

end
