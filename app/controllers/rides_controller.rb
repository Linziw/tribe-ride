class RidesController < ApplicationController

  def new
    @user=User.find(session[:user_id])
    @tribe=Tribe.find(params[:tribe_id])
    if params[:tribe_id] && @tribe.owner?(@user)
      @ride=Ride.new
    else
      redirect_to tribe_path(@tribe)
    end
  end

  def create
    @user=User.find(session[:user_id])
    @tribe=Tribe.find(params[:ride][:tribe_id])
    @ride=Ride.new(ride_params)
    @ride.save
    @user.tribes<<@tribe
    @user
    redirect_to tribe_path(@tribe)
  end

  def edit
    @user=User.find(session[:user_id])
    @tribe=Tribe.find(params[:tribe_id])
    @ride=Ride.find(params[:id])
  end

  def update
    @user=User.find(session[:user_id])
    @tribe=Tribe.find(params[:ride][:tribe_id])
    @ride=Ride.find(params[:id])
    @ride.update(ride_params)
    @ride.save
    redirect_to tribe_path(@tribe)

  end


  def show
    @user=User.find(session[:user_id])
    @ride=Ride.find(params[:id])
    @ride_users = @ride.users
    @user_ride = UserRide.new(user_id: @user.id, ride_id:@ride.id)
    @user_rides = UserRide.all
    if params[:tribe_id]
      @tribe=Tribe.find(params[:tribe_id])
    else
      @tribe=Tribe.find(@ride.tribe_id)
    end
  end

  def join_ride
    @user=User.find(session[:user_id])
    @ride = Ride.find(params[:id])
    @user.rides << @ride
    @user.save
    redirect_to tribe_path(@ride.tribe)
  end

  def destroy
    @user=User.find(session[:user_id])
    @ride=Ride.find(params[:id])
    @tribe=@ride.tribe
    @ride.delete
    redirect_to tribe_path(@tribe)
  end


  private

  def ride_params
  params.require(:ride).permit(:instructor, :date, :time, :duration, :format, :tribe_id, :original_date, :original_time)
  end
end
