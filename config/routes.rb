Rails.application.routes.draw do  
  root to: 'home#show'

  resources :users do
    resources :drink_histories
  end
  resources :beers, only: [:show, :index] do
    resources :drink_histories
  end

  resources :drink_histories
end
