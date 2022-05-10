Rails.application.routes.draw do

  get "/home", to: "home#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"

  resources :articles do
    resources :comments # nested routes
  end

    devise_scope :user do
      # Redirests signing out users back to sign-in
      get "users", to: "devise/sessions#new"
    end
    devise_for :users
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
