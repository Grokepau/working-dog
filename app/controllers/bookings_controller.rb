class BookingsController < ApplicationController
  skip_before_action :authenticate_user!

  def new
    @booking = Booking.new
    authorize @booking
  end

  def create
    raise
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.service = Service.find(params[:service_id])
    authorize @booking
    if @booking.save
      redirect_to dashboard_path
    else
      render :new
    end
  end

  private
  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:date, :service_id, :user_id)
  end
end
