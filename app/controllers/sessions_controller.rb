class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.authenticate_for_username(params[:username], params[:password])
    if user
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash.now.alert = "Invalid username or password. Please try again."
      render :new
    end
  end
end
