class ApplicationController < ActionController::Base
  helper_method :current_user,:logged_in?
  def current_user
    #the || helps in retreiving value from database if current user has been retrieved earlier
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    #turning the current user into a boolean
    !!current_user
  end
end
