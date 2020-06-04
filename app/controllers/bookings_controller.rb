class BookingsController < ApplicationController
  before_action :booking_set, only: [:show, :modify]
  
  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.status = "pending"
    
    if @booking.save
      redirect_to @booking
    else
      redirect_to car_path(@booking.car), alert: @booking.errors['dates'].first
    end
  end

  def index
    @bookings = Booking.where(user: current_user)
  end

  def show
    redirect_to bookings_path, notice: "Booking is not found." unless belongs_to_user?

    @days = (@booking.end_date.day - @booking.start_date.day).to_i
    @booking_price = (@booking.car.price * @days).round(2)
  end

  def modify
    redirect_to listmycars_cars_path, notice: "Booking is not found." unless belongs_to_user?

    case params[:my_action]
    when "approve" then approve_booking(@booking)
    when "decline" then decline_booking(@booking)
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :car_id, :user_id)
  end

  def booking_set
    @booking = Booking.find(params[:id])
  end

  def approve_booking(booking)
    message = ""
    if booking.approved
      message = "Booking is approved!"
    else
      message = "Failed to approve booking. Errors: #{booking.errors}"
    end
    redirect_to listmycars_cars_path, notice: message
  end

  def decline_booking(booking)
    message = ""
    if booking.declined
      message = "Booking is declined!"
    else
      message = "Failed to decline booking. Errors: #{booking.errors}"
    end
    redirect_to listmycars_cars_path, notice: message
  end

  def belongs_to_user?
    @booking.car.user == current_user || current_user.booking_ids.include?(@booking.id)
  end
end
