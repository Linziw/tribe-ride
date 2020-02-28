Rails.application.routes.draw do
  #nested resource routes
  resources :tribes do
    resources :rides
  end

  resources :user_rides
  resources :user_tribes
  resources :rides
  resources :users

  get '/' => 'sessions#welcome'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
  get '/signup' => 'users#new'
  get '/tribe_select' => 'users#tribe_select'
  get 'tribes/:id/rides/:id/join_ride' => 'rides#join_ride'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
