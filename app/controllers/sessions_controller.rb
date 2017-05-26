class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(username: params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      # test for flash message user doesn't exist of incorrect password.
      # test that it redirects to login page
      redirect_to login_path
    end
  end
end
