Rails.application.routes.draw do
  resources :users, only: [:update]
  resources :pools, only: [:show, :new, :create, :edit, :update] do
    resources :questions, only: [:create]
  end

  get "/users/edit", to: "users#edit", as: "edit_user"
  get "/lets-go", to: "sessions#new", as: "lets_go"
  post "/lets-go", to: "sessions#create", as: "sign_in"

  get "/confirmation/:id", to: "sessions#confirmation", as: "confirmation"
  post "/confirm", to: "sessions#confirm", as: "confirm"

  get "/dashboard", to: "users#show", as: "dashboard"
end
