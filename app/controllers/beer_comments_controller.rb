class BeerCommentsController < ApplicationController
  def create
    @beer = Beer.find(params[:beer_id])
    @comment = current_user.beer_comments.new(beer_comment_params)
    @comment.beer_id = @beer.id
    @comment.save

    @comment = BeerComment.new
  end

  def destroy
    @comment = current_user.beer_comments.find(params[:id])
    @comment.destroy
    redirect_back fallback_location: beers_path
  end

  private

  def beer_comment_params
    params.require(:beer_comment).permit(:comment)
  end
end
