class FoodController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]

  def index
    @foods = Food.all
  end

  def new
    @food = Food.new
  end

  def create
    @food = current_user.foods.new(post_params)
    if @food.save
      redirect_to root_path
    else
      redirect_to :new
    end
  end

  def destroy
    @food = Food.find(params[:id])
    @food.destroy
    flash[:notice] = 'The food item was successfully deleted.'
    redirect_to root_path
  end

  private

  def post_params
    params.require(:food).permit(:name, :measurement_unit, :price, :quantity)
  end
end
