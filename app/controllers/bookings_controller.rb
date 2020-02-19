class BookingsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_booking, only: :destroy

  def new
    @booking = Booking.new
    @service = Service.find(params[:service_id])
    authorize @booking
  end

  def create
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

  def destroy
    authorize @booking
    @booking.destroy!
    redirect_to dashboard_path
  end

  private
  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:date, :service_id, :user_id)
  end
end
