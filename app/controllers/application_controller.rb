class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :set_header_to_allow_js

  def login_required
    unless logged_in?
      session[:return_to] = request.fullpath
      redirect_to login_path and return false
    end
  end

  #--------------------
  
  def logged_in?
    session[:logged_in] == true
  end
  helper_method :logged_in?

  private

  # This has to be set to get around a browser XSS-protection problem.
  # More info at http://stackoverflow.com/questions/1547884/refused-to-execute-a-javascript-script-source-code-of-script-found-within-reque
  def set_header_to_allow_js
    response.headers['X-XSS-Protection'] = "0"
  end
end
