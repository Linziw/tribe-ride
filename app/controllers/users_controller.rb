class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user=User.new(user_params)
    @user.save
    session[:user_id] = @user.id
    redirect_to user_path(@user)
  end

  def show
    @user=User.find(params[:id])
    @rides = @user.rides
    @rides_sorted = @rides.sort_by { |r| r['date'] }
  end

  def tribe_select
    @user=User.find(session[:user_id])
  end

  def update
    @user=User.find(session[:user_id])
    @user.tribe_ids = params[:user][:tribe_ids]
    @user.save
  redirect_to user_path(@user)
  end

  

  private

  def user_params
  params.require(:user).permit(:username, :password, :email, :admin)
  end

end
