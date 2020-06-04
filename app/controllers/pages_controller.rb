class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    if params[:query].present?
      @cars = Car.where("location ILIKE ?", "%#{params[:query]}%")
    else
      @cars = Car.all
    end
  end

end
