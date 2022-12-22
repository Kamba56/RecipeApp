class FoodController < ApplicationController
  before_action :authenticate_user!

  def index; end

  def new
    @food = Food.new
  end

  def create; end
end
