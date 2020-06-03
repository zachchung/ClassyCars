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
    @cars = Car.all
  end

  def destroy
    @car = Car.find(params[:id])
    @car.destroy

    # no need for app/views/restaurants/destroy.html.erb
    redirect_to listmycars_cars_path
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
