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
      flash[:fail]
      render 'fail'
    end
    @user.exit = 0
    @user.time = 0
  end
  
  def show
    @user = User.find(params[:id])
    min_diff = Time.now.min - @user.updated_at.min
    min_diff > 0 ? @user.time = min_diff : @user.time = -min_diff
    hour_diff = Time.now.hour - @user.updated_at.hour
    if  hour_diff > 1 or (hour_diff == 1 and min_diff > 0)
      flash[:fail] = "Parece que você ficou tempo demais na fila, então te removemos automaticamente!"
      redirect_to destroy, params => {"user"=>{"nusp"=>"%{#{@user.nusp}}"}}
    end
  rescue ActiveRecord::RecordNotFound
    flash[:fail] = "Esse número não está registrado na fila!"
    render 'fail'
  end
  
  def update
    @user = User.find(params[:id])
    @user.time = Time.now.min - @user.updated_at.min
  end
  
  def destroy
    @user = User.find_by(nusp: params[:user][:nusp])
    if @user.nil?
      flash[:fail] = "Esse número não está registrado na fila!"
      render 'fail'
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
