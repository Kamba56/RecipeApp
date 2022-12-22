Rails.application.routes.draw do
  resources :recipes
  devise_for :users
  resources :food
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: "food#index"
end
