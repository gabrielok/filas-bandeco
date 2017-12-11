class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    @user.exit = 0
    @user.time = 0
    if @user.save
      flash[:success] = "Entrou na fila!"
      redirect_to @user
    else 
      flash[:fail]
      render 'fail'
    end
  end
  
  def show
    @user = User.find(params[:id])
    time = ((Time.now - @user.created_at)/60).to_i
    if time > 60
      flash[:fail] = "Parece que você ficou tempo demais na fila, então te removemos automaticamente!"
      @user.destroy
      render 'fail'
    else 
      if @user.exit == 0
        @user.time = time
        @user.save
      end
    end
  rescue ActiveRecord::RecordNotFound
    flash[:fail] = "Esse número não está registrado na fila (ou já saiu)!"
    render 'fail'
  end
  
  def update
    @user = User.find_by(nusp: params[:user][:nusp])
    if @user.update_attributes(user_params)
      flash[:success] = "Saída da fila registrada!"
      redirect_to @user
    else
      flash[:fail] = "Houve um problema"
      render 'fail'
    end
  end
  
  def destroy
    @user = User.find_by(nusp: params[:user][:nusp])
    if @user.nil?
      flash[:fail] = "Esse número não está registrado na fila (ou já saiu)!"
      render 'fail'
    else
      @user.destroy
      flash[:success] = "Saiu da fila!"
    end
  end
  
  
  private
    def user_params
      params.require(:user).permit(:nusp, :qrcode, :exit, :restaurant, :time)
    end
end
