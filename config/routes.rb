Rails.application.routes.draw do
  resources :widgets
  
  resources :store, only: [:index]
end
