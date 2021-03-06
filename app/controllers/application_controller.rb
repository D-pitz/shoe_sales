class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  def current_user
    User.find(session[:user]) if session[:user]
  end
  helper_method :current_user

  def current_date
    current_date = DateTime.now.strftime "%m/%d/%Y"
  end 
  helper_method :current_date

  def require_login
    if !current_user
      flash.alert = "You must be logged in to view this page."
      redirect_to "/"
    end
  end

end
