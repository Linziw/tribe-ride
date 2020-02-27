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
    @tribe=Tribe.find(params[:ride][:tribe_id])
    @ride=Ride.new(ride_params)
    @ride.save
    redirect_to tribe_path(@tribe)
  end

  def show
    @ride=Ride.find(params[:id])
  end

  private

  def ride_params
  params.require(:ride).permit(:instructor, :date, :time, :duration, :format, :tribe_id)
  end
end
