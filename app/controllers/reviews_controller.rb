class ReviewsController < ApplicationController
  before_action :set_restaurant

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.restaurant = @restaurant
    @review.save
    # we don't have an index of the reviews, so we redirect to the restaurant page,
    # which is where we display the reviews
    if @review.save
      redirect_to restaurant_path(@restaurant)
      # we don't want to be redirected to a create view
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end
end
