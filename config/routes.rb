Rails.application.routes.draw do
  root to: "home#index"

  resources :categories, only: [:index] do
    resources :items,    only: [:index]
  end
  resources :home,       only: [:index]
  resources :items,      only: [:index]
  # resources :cart_items, only: [:update]

  post "/cart_item_update",   to: "cart_items#update"
  post "/cart_items",        to: "cart_items#create"
  get  "/cart",              to: "cart_items#index"
  post "/delete_cart_items", to: "cart_items#destroy"
end
