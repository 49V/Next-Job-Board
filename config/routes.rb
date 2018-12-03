Rails.application.routes.draw do

  root 'static_pages#home'
  get '/account',   to: 'static_pages#account'
  get '/candidates', to: 'static_pages#candidates'
  get '/jobs',    to: 'static_pages#jobs'
  get '/users',  to: 'users#signup'
  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
