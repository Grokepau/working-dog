class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
  end

  def dashboard
    @services = current_user.services
    # @services = policy_scope(Service).where(user: current_user)
    @bookings = current_user.bookings
    # @bookings = policy_scope(Booking)
    @my_jobs=[]
    @services.each do |service|
    @my_jobs << Booking.where(service_id: service.id)
    end
  end
end
