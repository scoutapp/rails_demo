Rails.application.routes.draw do  
  resources :users
  root to: 'home#show'
end
