require 'date'

class BookingsController < ApplicationController
  # confirm page:
  def new
    # GET FROM PARAMS
    @car = Car.new(name: "Porsche 911", price: 500, location: "Melbourne")
    @start_date = Date.parse('28-12-2010')
    @end_date = Date.parse('31-12-2010')
    # END

    @days = (@end_date - @start_date).to_i
    @booking_price = @car.price * @days
    # @booking = Booking.new
  end

  private

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to @booking
    else
      render :new
    end
  end


  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :booking_price)
  end
end
