Rails.application.routes.draw do
  get 'users/new'

  root 'static_pages#home'
  get '/account',   to: 'static_pages#account'
  get '/candidates', to: 'static_pages#candidates'
  get '/jobs',    to: 'static_pages#jobs'
  get '/signup',  to: 'users#new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
