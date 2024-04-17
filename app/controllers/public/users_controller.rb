class Public::UsersController < ApplicationController
  before_action :authenticate_user, only: [:edit, :update]
  def show
    @user = User.find(params[:id])
    @new_beer = Beer.new
  end

  def index
    @users = User.all
    @new_beer = Beer.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "User updated successfully"
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  private

  def authenticate_user
    @user = User.find(params[:id])
    unless @user == current_user && current_user.email != "guest@example.com"
      redirect_to user_path(current_user)
    end
  end

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
