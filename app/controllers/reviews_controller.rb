class ReviewsController < ApplicationController
  def new
    @booking = Booking.find(params[:booking_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @booking = Booking.find(params[:booking_id])
    @review.booking = @booking
    if @review.save
      redirect_to bookings_path(@booking)
    else
      render :new
    end
  end

  def show_reviews
    @reviews = Reviews.all
  end
  private

  def review_params
    params.require(:review).permit(:description, :rating)
  end
end
