class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :subscribe

	# Include the helper method 
  include ApplicationHelper

  # redirect user after sign in
  def after_sign_in_path_for(resource)
    admin_dashboard_path
  end

  # Define the subscribe model to all the pages
  def subscribe
    @subscribe = Subscribe.new
  end

end