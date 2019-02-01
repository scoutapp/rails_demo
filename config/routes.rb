Rails.application.routes.draw do  
  root to: 'home#show'

  resources :users
  resources :beers, only: [:show, :index]
end
