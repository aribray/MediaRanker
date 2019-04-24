# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'works#main'
  resources :works

  
  get '/login', to: 'users#login_form', as: 'login'
  post '/login', to: 'users#login'
  post '/logout', to: 'users#logout', as: 'logout'
  get '/users/current', to: 'users#current', as: 'current_user'
  post '/vote/:id', to: 'users#vote', as: 'vote'

  
end
