Rails.application.routes.draw do
  root to: "home#index"

  resources :categories, only: [:index] do
    resources :items, only: [:index]
  end
  resources :home, only: [:index]
  resources :items, only: [:index]
  resources :users, only: [:new, :create]

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  post "/cart_items", to: "cart_items#create"
  get  "/cart", to: "cart_items#index"
  post "/delete_cart_items", to: "cart_items#destroy"
end
