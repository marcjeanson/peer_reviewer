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

  def destroy
    session[:user_id] = nil
    redirect_to new_session_path
  end
end
