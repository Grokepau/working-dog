class ServicesController < ApplicationController
  layout 'application-no-nav', only: :index
  before_action :set_service, only: [:show, :destroy]
  skip_before_action :authenticate_user!, only: :index
  def index
    # gives everyone access to the index page logeed in or not !!
    @services = policy_scope(Service).order(created_at: :desc)
  end

  def show
    authorize @service
    @user = current_user
  end

  def new
    @service = Service.new
    authorize @service
  end

  def create
    @service = Service.new(service_params)
    @service.user = current_user
    authorize @service
    if @service.save
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def destroy
    authorize @service
    @service.destroy!
    redirect_to dashboard_path
  end

  private
  def set_service
    @service = Service.find(params[:id])
  end

  def service_params
    params.require(:service).permit(:title, :description, :user_id, :price)
  end
end
