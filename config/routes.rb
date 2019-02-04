Rails.application.routes.draw do  
  root to: 'home#show'

  resources :users do
    resources :drink_histories
    resources :reviews
    member do
      get :followings, :followers
    end
  end
  resources :relationships, only: [:create, :destroy]

  resources :beers, only: [:show, :index] do
    resources :drink_histories
    resources :reviews
  end

  resources :drink_histories
  resources :reviews
end
