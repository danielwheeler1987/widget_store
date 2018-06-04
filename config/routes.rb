Rails.application.routes.draw do

  root 'store#index'

  resources :finalize_checkout, only: [:index]

  resources :orders, only: [:show]

  resources :shopping_cart_items, only: [:create, :destroy]

  resources :widgets

  resources :sizes,
            only: [:index, :show, :create, :update, :destroy],
            constraints: lambda { |req| req.format == :json }

  resources :colors,
            only: [:index, :show, :create, :update, :destroy],
            constraints: lambda { |req| req.format == :json }

  resources :categories,
            only: [:index, :show, :create, :update, :destroy],
            constraints: lambda { |req| req.format == :json }

  resources :store, only: [:index]
end
