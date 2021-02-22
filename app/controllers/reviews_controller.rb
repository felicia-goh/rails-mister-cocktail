class ReviewsController < ApplicationController
  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @review = Review.new(strong_params)
    @review.cocktail = @cocktail

    if @review.save
      redirect_to cocktail_path(@cocktail)
    else
      @reviews = Review.where(cocktail: @cocktail)
      render 'cocktails/show'
    end
  end

  def destroy
    review = Review.find(params[:id])
    review.destroy
    @reviews = Review.where(cocktail: review.cocktail)
    redirect_to cocktail_path(review.cocktail)
  end

  private

  def strong_params
    params.require(:review).permit(:rating, :content)
  end
end
