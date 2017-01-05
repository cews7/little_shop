Rails.application.routes.draw do
  root to: "home#index"

  resources :home, only: [:index]
  resources :items, only: [:index]

  post "/cart_items", to: "cart_items#create"
  get  "/cart", to: "cart_items#index" 
end
