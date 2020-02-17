class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
  end

  def index
    @services = current_user.services
  end
end
