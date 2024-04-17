class Public::SearchesController < ApplicationController
  def search
    @new_beer = Beer.new
    @range = params[:range]
    @word = params[:word]

    if @range == "User"
      @users = User.looks(params[:search], params[:word])
    else
      @beers = Beer.looks(params[:search], params[:word])
    end
  end
end
