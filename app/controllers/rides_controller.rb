class RidesController < ApplicationController

  def new
    @user=User.find(session[:user_id])
    if params[:tribe_id]
      @ride=Ride.new
    @tribe=Tribe.find(params[:tribe_id])
    else
      redirect_to user_path(@user)
    end

    
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
