class ApplicationController < ActionController::Base

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?
  
  before_action :set_upcoming_shows
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def logged_in?
    !!current_user
  end
  
  def require_user(path=root_path)
    if !logged_in?
      flash[:danger] = "You must be logged in to perform that action"
      redirect_back(fallback_location: path)
    end
  end
  
  def require_admin_user(path=root_path)

    if !logged_in? or !current_user.admin?
      flash[:danger] = "You must be an admin to perform that action"
      redirect_back(fallback_location: path)
    end
  end

  private
  
  def set_upcoming_shows
    @nextfiveshows = Show.nextfiveshows
  end
  
    
end
