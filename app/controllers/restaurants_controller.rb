class RestaurantsController < ApplicationController
  def new
  end
  def index
    @restaurant = Restaurant.all
  end
  def show
    @restaurant = Restaurant.find(params[:id])
  end
  def quimica
  end
  def prefeitura
  end
  def central
  end
  def fisica
  end
end
