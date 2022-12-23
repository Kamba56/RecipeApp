class RecipeFoodsController < ApplicationController
  def destroy
    @recipe_food = RecipeFood.find(params[:id])
    recipe = Recipe.find(@recipe_food.recipe_id)
    @recipe_food.destroy
    flash[:notice] = 'The ingredient was successfully deleted.'
    redirect_to recipe_path(recipe)
  end

  def new
  end

  def create
  end
end
