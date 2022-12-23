class RecipeFoodsController < ApplicationController
  def destroy
    @recipe_food = RecipeFood.find(params[:id])
    recipe = Recipe.find(@recipe_food.recipe_id)
    @recipe_food.destroy
    flash[:notice] = 'The ingredient was successfully deleted.'
    redirect_to recipe_path(recipe)
  end

  def new
    @recipe_food = RecipeFood.new
  end

  def create
    @recipe_food = current_user.recipe_foods.new(post_params)
    if @recipe_food.save
      redirect_to root_path
    else
      redirect_to :new
    end
  end

  private

  def post_params
    params.require(:recipe_food).permit(:quantity, :food, :recipe)
  end
end
