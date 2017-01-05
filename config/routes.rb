Rails.application.routes.draw do
  root to: "home#index"

  resources :categories, only: [:index] do
    resources :items, only: [:index]
  end
  resources :home, only: [:index]
  resources :items, only: [:index]
end
