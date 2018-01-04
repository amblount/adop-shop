Rails.application.routes.draw do

  root :to => 'welcome#index'

  resources :carrierwave_images, only: [:index, :show]

  resources :dogs, only: [:index, :show, :create, :destroy]

  resources :categories, only: [:show, :index]

  namespace :admin, only: [:new] do
    resources :dogs
    resources :carrierwave_images
  end

  resources :users, only: [:new, :create]

  resources :carts, only: [:create]

  get '/cart', to: "carts#show"
  delete '/cart', to: "carts#destroy"
  put '/cart', to: "carts#update"

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get "/dashboard", to: "users#show"

end
