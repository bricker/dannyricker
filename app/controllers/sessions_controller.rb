class SessionsController < ApplicationController
  require 'digest/sha1'

  USERNAME = APP_CONFIG["admin_username"]
  PASSWORD = APP_CONFIG["admin_password"]
  
  #--------------------

  def new
    redirect_to root_path, notice: "You are already logged in." if logged_in?
  end

  def create
    if Digest::SHA1.hexdigest(params[:username]) == USERNAME && Digest::SHA1.hexdigest(params[:password]) == PASSWORD
      session[:logged_in] = true
      redirect_to session[:return_to] || root_path, notice: 'Logged in.'
      session[:return_to] = nil
    else
      redirect_to login_path, alert: "Wrong info."
    end
  end

  #--------------------
  
  def destroy
    session[:logged_in] = nil
    redirect_to root_path, notice: "Logged out."
  end
end
