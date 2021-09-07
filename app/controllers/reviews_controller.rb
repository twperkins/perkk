class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    @perk = Perk.find(params[:perk_id])
    @review.perk = @perk
    @review.user = current_user
    if @review.save
      redirect_to perk_path(@perk)
    else
      flash[:notice] = 'Review could not be saved: please leave a comment as well as a rating.'
      redirect_to perk_path(@perk)
    end
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating)
  end
end
