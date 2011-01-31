class SessionsController < ApplicationController

  def create
    omniauth = request.env["omniauth.auth"]
    authentication = Authentication.find_by_provider_and_uid(omniauth["provider"], omniauth["uid"]) || Authentication.create_with_omniauth(omniauth)
    session[:auth_id] = authentication.id
    session[:auth_provider] = omniauth["provider"] 
    session[:auth_info] = omniauth["user_info"]
    redirect_to root_url, :notice => "Signed in!"
  end

  def destroy
    session[:auth_id],session[:auth_provider],session[:auth_info] = nil
    redirect_to root_url, :notice => "Signed out!"
  end 

end
