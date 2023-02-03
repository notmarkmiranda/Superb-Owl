Rails.application.routes.draw do
  get "/lets-go", to: "sessions#new", as: "lets_go"
  post "/lets-go", to: "sessions#create", as: "sign_in"

  get "/confirmation/:id", to: "sessions#confirmation", as: "confirmation"
  post "/confirm", to: "sessions#confirm", as: "confirm"

  get "/dashboard", to: "users#show", as: "dashboard"
end
