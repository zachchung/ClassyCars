class BookingsController < ApplicationController
  # confirm page:
  def new
    # GET FROM CARS#SHOW'S PARAMS
    # @car = Car.new(name: "Porsche 911", price: 500, location: "Melbourne")
    # @start_date = Date.parse('28-12-2020')
    # @end_date = Date.parse('31-12-2020')
    @car = Car.find(rand(1..10))
    @start_date = DateTime.now
    @end_date = DateTime.now + rand(1..7)

    # END

    @days = (@end_date - @start_date).to_i
    @booking_price = (@car.price * @days).round(2)
    # @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
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
  end

  # private

  # def create
  #   @booking = Booking.new(booking_params)
  #   if @booking.save
  #     redirect_to @booking
  #   else
  #     render :new
  #   end
  # end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
