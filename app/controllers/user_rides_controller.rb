class UserRidesController < ApplicationController

  def destroy
    @user=User.find(session[:user_id])
    @ride=Ride.find(params[:id])
  
    @user.rides.delete(@ride)
    @ride.users.delete(@user)

    @user.save
    @ride.save
    redirect_to user_path(@user)
  end

  def create
    @ride=Ride.find(params[:user_ride][:ride_id])
    @user_ride = UserRide.new
    @user_ride.user_id = session[:user_id]
    @user_ride.ride_id = @ride.id
    @user_ride.milestone = params[:user_ride][:milestone]
    @user_ride.save
    redirect_to tribe_ride_path(@ride.tribe, @ride)
    
  end

  

end
