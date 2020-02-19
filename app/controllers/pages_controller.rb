class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
  end

  def dashboard
    @services = current_user.services
    p @services
    # @bookings = current_user.bookings
  end
end
