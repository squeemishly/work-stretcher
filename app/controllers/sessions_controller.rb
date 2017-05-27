class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(username: params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to login_path, alert: "Login failed. Please try again."
    end
  end

  def destroy
    session.clear
    redirect_to root_path, alert: "You have been logged out."
  end
end
