Rails.application.routes.draw do
  #nested resource routes
  resources :tribes do
    resources :rides, only: [:create, :new, :edit, :destroy, :show, :destroy, :index]
    resources :users 
  end

  resources :user_rides
  resources :user_tribes
  resources :rides, only: [:create, :new, :edit, :destroy, :show]
  resources :users, only: [:create, :new, :edit, :destroy, :show]

  get '/auth/facebook/callback' => 'users#facebook_create'
  get '/' => 'sessions#welcome'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
  get '/signup' => 'users#new'
  get 'tribes/:id/rides/:id/join_ride' => 'rides#join_ride'
  patch 'user_tribes' => 'user_tribes#update'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
