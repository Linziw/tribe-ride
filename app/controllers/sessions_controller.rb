class SessionsController < ApplicationController

  def welcome
  end

  def new
  end

  def create
  @user= User.find_by_username(params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to '/login'
    end
  end

end