class CarsController < ApplicationController
  def new
    @car = Car.new
  end

  def create
    @car = Car.new

    if @car.save
      redirect_to car_path(@car)
    else
      render :new
    end
  end
end
