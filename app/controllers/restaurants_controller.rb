class RestaurantsController < ApplicationController
  def index
    @restaurant = Restaurant.all
  end
  
  def show 
    # cardápio
    @restaurant = Restaurant.find(params[:id])
  end
  
  def info
    # ações da fila
    @restaurant = Restaurant.find(params[:id])
    @user = User.new
  end
end
