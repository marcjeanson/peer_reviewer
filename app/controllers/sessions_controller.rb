class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.authenticate_for_username(params[:username], params[:password])
    session[:user_id] = user.id
    redirect_to root_path
  end
end
