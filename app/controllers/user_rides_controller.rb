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

end
