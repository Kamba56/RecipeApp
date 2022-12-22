class RecipesController < ApplicationController
  def index
    @recipes = current_user.recipes
  end

  def public_recipe
    @recipes = Recipe.where(public: true).order(created_at: :desc)
  end
end
