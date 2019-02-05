Rails.application.routes.draw do  
  root to: 'home#show'

  # Don't allow users to create/delete/update the record for now
  resources :users, only: [:index, :show] do
    resources :drink_histories, only: [:index, :show]
    resources :reviews, only: [:index, :show]
    resources :relationships, only: [:create, :destroy]
    member do
      get :followings, :followers
    end
  end

  resources :beers, only: [:show, :index] do
    resources :drink_histories, only: [:show, :index]
    resources :reviews, only: [:show, :index]
  end

  resources :drink_histories, only: [:show, :index]
  resources :reviews, only: [:show, :index]
end
