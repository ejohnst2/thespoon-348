class ReviewsController < ApplicationController
  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    # finding the restaurant to be reviewed
    @restaurant = Restaurant.find(params[:restaurant_id])
    # creating new instance of review with form params
    @review = Review.new(review_params)
    # attaching restaurant to review
    @review.restaurant = @restaurant
    #saving to the DB
    @review.save
    # go back to the restaurant page
    redirect_to restaurant_path(@restaurant)
  end

  def index
    @restaurant = Restaurant.find(params[:restaurant_id])
    @reviews = @restaurant.reviews
  end

  private

  def review_params
    params.require(:review).permit(:content, :stars)
  end
end
