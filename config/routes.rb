Rails.application.routes.draw do

  get 'password_resets/new'

  get 'password_resets/edit'

  get 'sessions/new'

  root 'static_pages#home'
  get '/account',    to: 'static_pages#account'
  get '/candidates', to: 'static_pages#candidates'
  get '/jobs',       to: 'jobs#jobs'
  get '/users',      to: 'users#signup'
  get '/index',      to: 'users#index'
  get '/login',      to: 'sessions#new'
  post '/login',     to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :jobs,                only: [:create, :destroy]
end
