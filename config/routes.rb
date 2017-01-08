Rails.application.routes.draw do
  root to: "home#index"

  resources :categories,      only: [:index] do
    resources :items,         only: [:index]
  end

  namespace :admin do
    resources :home,            only: [:index]
  end

  resources :home,            only: [:index]
  resources :items,           only: [:index, :show]
  resources :users,           only: [:new, :create]
  resources :orders,          only: [:index]

  get "/login",               to: "sessions#new"
  post "/login",              to: "sessions#create"
  get "/logout",              to: "sessions#destroy"
  get "/dashboard",           to: "users#show"

  post "/cart_item_update",   to: "cart_items#update"
  post "/cart_items",         to: "cart_items#create"
  get  "/cart",               to: "cart_items#index"
  post "/delete_cart_items",  to: "cart_items#destroy"
end
