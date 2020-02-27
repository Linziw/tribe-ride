class RidesController < ApplicationController

  def new
    @ride=Ride.new  
  end

  def create
    @user=User.find(session[:user_id])
    #need to add nested resources to be able to get params id of tribe to associate
    @ride=Ride.new(ride_params)
    binding.pry
    @ride.save
    redirect_to user_path(@user)
    #should go back to tribe page
  end

  private

  def ride_params
  params.require(:ride).permit(:instructor, :date, :time, :duration, :format)
  end
end
