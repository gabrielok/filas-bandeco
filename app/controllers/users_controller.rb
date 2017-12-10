class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    @user = User.new
    @user.nusp = params[:user][:nusp]
    @user.restaurant = params[:user][:restaurant]
    if @user.save
      flash[:success] = "Entrou na fila!"
      redirect_to @user
    else 
      flash[:fail] = "Falha"
      render 'fail'
    end
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @user.exit = 1
  end
  
  def destroy
    User.find_by(nusp: params[:user][:nusp]).destroy
    flash[:success] = "Saiu da fila!"
    redirect_to exit
  end
  
  
  private
    def user_params
      params.require(:nusp, :restaurant).permit(:qrcode)
    end
end
