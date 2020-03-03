class SessionsController < ApplicationController

  def welcome
  end

  def new
  end

  def create
  @user= User.find_by_name(params[:name])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to '/login'
    end
  end

  def destroy     
    session[:user_id] = nil         
    redirect_to '/' 
  end

end