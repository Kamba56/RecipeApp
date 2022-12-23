Rails.application.routes.draw do
  resources :recipes, only: [:index, :show, :destroy]
  devise_for :users
  resources :food, only: %i[index show new create destroy]
  resources :recipe_foods, only: %i[new create destroy]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get 'public_recipe', to: 'recipes#public_recipe', as: :public_recipe
  get 'shopping_list', to: 'users#shopping_list', as: :shopping_list

  # Defines the root path route ("/")
  root to: "food#index"
end
