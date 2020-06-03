class BookingsController < ApplicationController

  booking_status = %w[pending confirmed cancelled returned renting]

  def new; end

  def create
    @booking = Booking.new(booking_params)
    @booking.status = "pending"
    if @booking.save
      redirect_to @booking
    else
      render :new
    end
  end

  def index
    @bookings = Booking.where(user: current_user)
  end

  def show
    @booking = Booking.find(params[:id])
    # @days = @booking.end_date - @booking.start_date
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :car_id, :user_id)
  end
end
