Rails.application.routes.draw do
  root to: "home#index"

  namespace :admin do
    resources :dashboard,              only: [:index, :edit, :update]
    resources :orders,                 only: [:index, :show]
    resources :items,                  only: [:index, :edit]
  end

  resources :items,                    only: [:index, :show]
  resources :home,                     only: [:index]
  resources :users,                    only: [:new, :create]
  resources :orders,                   only: [:index, :show, :create]
  resources :categories,               only: [:index]

  get "/login",                        to: "sessions#new"
  post "/login",                       to: "sessions#create"
  get "/logout",                       to: "sessions#destroy"
  get "/dashboard",                    to: "users#show"
  post "/admin/dashboard/:id/edit",    to: "admin/dashboard#update"

  post "/cart_item_update",            to: "cart_items#update"
  post "/cart_items",                  to: "cart_items#create"
  get  "/cart",                        to: "cart_items#index"
  post "/delete_cart_items",           to: "cart_items#destroy"
  post "/new_order",                   to: "orders#create"

  resources :categories,  :path => '', only: [:show]
end
