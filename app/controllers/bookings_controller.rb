class BookingsController < ApplicationController

  booking_status = %w[pending confirmed cancelled returned renting]

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.status = "pending"
    # issues if booking dates are not valid, need to redirect_to show page again 
    if @booking.save
      redirect_to @booking
    else
      redirect_to car_path(@booking.car), alert: @booking.errors['dates'].first
      # Keep this to check with TAs tomorrow
      # redirect_to car_path(@booking.car), alert: @booking.errors['dates'].first, data: { data_booking: @booking, data_car: @booking.car  }
      # render template: 'cars/show', data: @booking, alert: @booking.errors['dates'].first
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
