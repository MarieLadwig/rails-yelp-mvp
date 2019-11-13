class ReviewsController < ApplicationController

  #def new
   # @review = Review.new
    #@restaurant = Restaurant.find(params[:restaurant_id])
  #end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new(review_params)
    @review.restaurant = @restaurant
    @average_review = @restaurant.reviews.average(:rating)
    @average_review = 0 if @average_review.nil?
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render 'restaurants/show'
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
