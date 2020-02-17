class ServicesController < ApplicationController
  layout 'application-no-nav', only: :index
  def index
    # gives everyone access to the index page logeed in or not !!
    @services = policy_scope(Service).order(created_at: :desc)
  end
end
