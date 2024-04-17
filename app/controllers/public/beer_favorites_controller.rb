class Public::FavoritesController < ApplicationController
  def create
    @beer = Beer.find(params[:beer_id])
    @favorite = current_user.favorites.new(beer_id: @beer.id)
    @favorite.save
  end

  def destroy
    @beer = Beer.find(params[:beer_id])
    @favorite = current_user.favorites.find_by(beer_id: @beer.id)
    @favorite.destroy
  end


end
