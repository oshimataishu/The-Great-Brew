class RelationshipsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    current_user.follow(@user)
    redirect_back fallback_location: users_path
  end

  def destroy
    @user = User.find(params[:user_id])
    current_user.unfollow(@user)
    redirect_back fallback_location: users_path
  end

  def followings
    @new_beer = Beer.new
    @user = User.find(params[:user_id])
    @followings = @user.followings
  end

  def followers
    @new_beer = Beer.new
    @user = User.find(params[:user_id])
    @followers = @user.followers
  end
end
