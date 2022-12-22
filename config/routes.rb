Rails.application.routes.draw do
  resources :recipes, only: [:index]
  devise_for :users
  resources :food, only: %i[index show new create destroy]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get 'public_recipe', to: 'recipes#public_recipe', as: :public_recipe

  # Defines the root path route ("/")
  root to: "food#index"
end
