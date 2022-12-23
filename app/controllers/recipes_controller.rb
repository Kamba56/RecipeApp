class RecipesController < ApplicationController
  before_action :authenticate_user!, except: %i[index show public_recipe]

  def index
    if current_user
      @recipes = current_user.recipes
    else
      redirect_to public_recipe_path
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
    @foods = @recipe.recipe_foods.includes(:food)
  end

  def public_recipe
    @recipes = Recipe.where(public: true).order(created_at: :desc)
  end
end
