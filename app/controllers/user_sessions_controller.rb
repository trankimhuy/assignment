class UserSessionsController < ApplicationController
  before_action :redirect_logged_in, only: [:new, :create]
  before_action :require_user, only: [:destroy]

  def create
  	@user = User.find_by_email(params[:session][:email])
  	if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
  	  redirect_to root_path
  	else
  	  redirect_to login_path, notice: 'Account or Password is incorrect'
    end
  end

  def destroy
  	session[:user_id] = nil
  	reset_session
    redirect_to login_path, notice: "You have been logged out."
  end

end
