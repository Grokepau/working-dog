class ServicesController < ApplicationController
  layout 'application-no-nav', only: :index
  skip_before_action :authenticate_user!, only: :index
  def index
    # gives everyone access to the index page logeed in or not !!
    @services = policy_scope(Service).order(created_at: :desc)
  end

  def show
    @service = Service.find(params[:id])
    authorize @service
  end

end
