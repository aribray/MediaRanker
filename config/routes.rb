# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'works#main'
  resources :works

  get '/users', to: 'users#index', as: 'users'

  # combine current user with users#show?
  get '/users/:id', to: 'users#show', as: 'user'
  get "/auth/github", as: "github_login"
  get "/auth/:provider/callback", to: "users#create"
  delete "/logout", to: "users#destroy", as: "logout"
  # get '/login', to: 'users#login_form', as: 'login'
  # post '/login', to: 'users#login'
  # post '/logout', to: 'users#logout', as: 'logout'
  post '/vote/:id', to: 'users#vote', as: 'vote'
end
