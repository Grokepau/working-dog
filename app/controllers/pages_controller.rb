class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
  end

  def dashboard
    @services = current_user.services
    @bookings = current_user.bookings
    @my_jobs=[]
    @services.each do |service|
      @my_jobs << Booking.where(service_id: service.id)
    end
  end
end
