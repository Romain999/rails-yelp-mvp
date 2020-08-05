class ReviewsController < ApplicationController

  def new
    @review = Review.new
    @restaurant = Restaurant.find(params[:restaurant_id])
    redirect_to new_restaurant_review_path
  end
  def create
     @restaurant = Restaurant.find(params[:restaurant_id])
     @review = Review.new(review_params)
     @review.restaurant = @restaurant
     if @review.save
      redirect_to restaurant_path(@restaurant)
     else
      render 'restaurants/show'
     end

  end

   def destroy
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = @restaurant.review.find(params[:id])
    @review.destroy
    redirect_to restaurant_path(@restaurant)
  end

   private
     def review_params
       params.require(:review).permit(:content, :rating)
     end
end
