Rails.application.routes.draw do
  root "home#index"

  get "/sign-up", to: "users#new", as: "sign_up"
  post "/sign-up", to: "users#create"

  get "/sign-in", to: "sessions#new", as: "sign_in"
  post "/sign-in", to: "sessions#create"

  get "/sign-out", to: "sessions#destroy", as: "sign_out"

  get "/dashboard", to: "users#show", as: "dashboard"

  resources :pools, only: [:new, :create, :show]
end
