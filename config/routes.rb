Rails.application.routes.draw do
  root "home#index"

  get "/sign-up", to: "users#new", as: "sign_up"
  post "/sign-up", to: "users#create"

  get "/dashboard", to: "users#show", as: "dashboard"
end
