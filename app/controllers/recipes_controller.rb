class RecipesController < ApplicationController
  def index
    unless current_user
      redirect_to public_recipe_path
      return
    else
      @recipes = current_user.recipes
    end
  end

  def public_recipe
    @recipes = Recipe.where(public: true).order(created_at: :desc)
  end
end
