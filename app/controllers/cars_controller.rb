class CarsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    @car.user = current_user

    if @car.save
      redirect_to car_path(@car)
    else

      render :new
    end
  end

  def show
    @car = Car.find(params[:id])
    @booking = Booking.new
  end

  def index
    # @cars = Car.all
    @cars = Car.geocoded # returns cars with coordinates

    @markers = @cars.map do |car|
      {
        lat: car.latitude,
        lng: car.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { car: car }),
        image_url: helpers.asset_url('ferrari.png')
      }
    end
  end

  def destroy
    @car = Car.find(params[:id])

    if @car.bookings.count.zero?
      @car.destroy
      redirect_to listmycars_cars_path
    else
      redirect_to listmycars_cars_path, alert: "Car cannot be removed. There are still bookings for this car."
    end
  end

  # def edit
  #   @car = Car.find(params[:id])
  #   @car.update(car_params)
  #   # Will raise ActiveModel::ForbiddenAttributesError
  # end

  def listmycars
    @cars = current_user.cars
  end


  private

  def car_params
    params.require(:car).permit(:name, :location, :seats, :year, :price)
  end
end
