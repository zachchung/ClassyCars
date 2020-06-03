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
        image_url: helpers.asset_url('ferrari')
      }
    end
  end

  def destroy
    @car = Car.find(params[:id])
    @car.destroy

    # no need for app/views/restaurants/destroy.html.erb
    redirect_to car_path
  end

  private

  def car_params
    params.require(:car).permit(:name, :location, :seats, :year, :price)
  end
end
