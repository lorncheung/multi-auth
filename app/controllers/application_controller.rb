class ApplicationController < ActionController::Base

  protect_from_forgery
  helper_method :current_user

  private
  def current_user
    @current_user ||= Authentication.find(session[:auth_id]) if session[:auth_id]
  end 

end
