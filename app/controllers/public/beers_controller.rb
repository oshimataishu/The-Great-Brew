class Public::BeersController < ApplicationController
  before_action :is_matching_author, only: [:edit, :update]
  before_action :set_beer, only: %i[show edit update destroy]
  before_action :set_new_beer, only: %i[show index]

  def create
    @new_beer = current_user.beers.new(beer_params)
    if @new_beer.save
      flash[:notice] = "Beer created successfully"
      redirect_to beer_path(@new_beer)
    else
      @beers = Beer.all
      render 'beers/index'
    end
  end

  def show
    @comment = BeerComment.new
  end

  def index
    @beers = Beer.latest.page(params[:page])
  end

  def edit; end

  def update
    if @beer.update(beer_params)
      redirect_to beer_path(@beer), notice: 'Beer updated successfully'
    else
      render :edit
    end
  end

  def destroy
    @beer.destroy
    redirect_to beers_path, notice: 'Beer deleted successfully'
  end

  private

  def set_beer
    @beer = Beer.find(params[:id])
  end

  def set_new_beer
    @new_beer = Beer.new
  end

  def beer_params
    params.require(:beer).permit(:title, :body, :image)
  end

  def is_matching_author
    @beer = Beer.find(params[:id])
    unless @beer.user == current_user
      redirect_to beers_path
    end
  end
end
