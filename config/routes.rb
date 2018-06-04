Rails.application.routes.draw do
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
