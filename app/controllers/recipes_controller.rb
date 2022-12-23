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
    @recipe_foods = @recipe.recipe_foods.includes(:food)
  end

  def public_recipe
    @recipes = Recipe.where(public: true).order(created_at: :desc)
  end

  def destroy
    recipe_foods = RecipeFood.where(recipe_id: params[:id])
    recipe_foods.each { |rf| rf.destroy }
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    flash[:notice] = 'The recipe was successfully deleted.'
    redirect_to recipes_path
  end
end
