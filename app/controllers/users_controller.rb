class UsersController < ApplicationController
  def shopping_list
    @recipe_foods = RecipeFood.includes(:food).where(recipe_id: params[:recipe])
    @total = 0
    @recipe_foods.each do |rf|
      @total += rf.food.price * rf.quantity
    end
  end
end
