class ServicesController < ApplicationController
  def index
    @services = policy_scope(Service).order(created_at: :desc)
  end
end
