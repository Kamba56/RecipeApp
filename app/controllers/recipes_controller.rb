class RecipesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :public_recipe]

  def index
    unless current_user
      redirect_to public_recipe_path
      return
    else
      @recipes = current_user.recipes
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
