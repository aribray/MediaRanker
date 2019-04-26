# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'works#main'
  resources :works

  get '/users', to: 'users#index', as: 'users'

  get '/users/:id', to: 'users#show', as: 'user'

  get '/login', to: 'users#login_form', as: 'login'
  post '/login', to: 'users#login'
  post '/logout', to: 'users#logout', as: 'logout'
  post '/vote/:id', to: 'users#vote', as: 'vote'
end
