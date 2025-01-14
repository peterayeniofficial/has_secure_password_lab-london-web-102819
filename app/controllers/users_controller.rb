class UsersController < ApplicationController

  def index 
    @users = User.all
  end

  def show 
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create 
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to user_path(@user)
    else 
      render :new
    end
  end

  def user_params
    params.required(:user).permit(:name, :email, :password, :password_confirmation)
  end

  
end
