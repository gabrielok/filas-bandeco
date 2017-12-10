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
    @user.exit = 0
    @user.time = 0
  end
  
  def show
    @user = User.find(params[:id])
    @user.time = Time.now.min - @user.updated_at.min
  end
  
  def update
    @user = User.find(params[:id])
    @user.time = Time.now.min - @user.updated_at.min
  end
  
  def destroy
    @user = User.find_by(nusp: params[:user][:nusp])
    if @user.nil?
      flash[:fail] = "Esse número não está registrado na fila!"
    else
      @user.destroy
      flash[:success] = "Saiu da fila!"
    end
  end
  
  
  private
    def user_params
      params.require(:nusp, :restaurant).permit(:qrcode)
    end
end
