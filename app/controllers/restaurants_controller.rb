class RestaurantsController < ApplicationController
  def index
    @restaurant = Restaurant.all
  end
  def show
    @restaurant = Restaurant.find(params[:id])
  end
  def info
    @restaurant = Restaurant.find(params[:id])
  end
end
