# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'works#main'
  resources :works

  get '/users/:id', to: 'users#show', as: 'user'
  get '/users', to: 'users#index', as: 'users'

  get '/auth/github', as: 'github_login'
  get '/auth/:provider/callback', to: 'users#create'
  delete '/logout', to: 'users#destroy', as: 'logout'

  post '/vote/:id', to: 'users#vote', as: 'vote'
end
