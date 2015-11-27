class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    if session[:user_id]
      @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
    end
  end

  def require_admin
    if current_user
      redirect_to root_path, notice: "You must be admin to access that page." unless current_user.admin?
    else
      redirect_to login_path, notice: "You must be logged in to access that page." unless current_user
    end
  end

  def require_user
    redirect_to login_path unless current_user
  end

  def redirect_logged_in
    redirect_to root_path if current_user
  end
end
