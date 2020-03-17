class RidesController < ApplicationController
  def new
    if helpers.logged_in?
      @user = User.find(session[:user_id])
      @tribe = Tribe.find(params[:tribe_id])
      if params[:tribe_id] && @tribe.owner?(@user)
        @ride = @tribe.rides.build
      else
        redirect_to tribe_path(@tribe)
      end
    else
      redirect_to "/"
    end
  end

  def create
    @user = User.find(session[:user_id])
    @tribe = Tribe.find(params[:ride][:tribe_id])
    @ride = @tribe.rides.build(ride_params)
    if @ride.save
      @user.tribes << @tribe
      redirect_to tribe_path(@tribe)
    else
      render "new"
    end
  end

  def edit
    if helpers.logged_in?
      @user = User.find(session[:user_id])
      @tribe = Tribe.find(params[:tribe_id])
      @ride = Ride.find(params[:id])
    else
      redirect_to "/"
    end
  end

  def update
    @user = User.find(session[:user_id])
    @ride = Ride.find(params[:id])
    @tribe = @ride.tribe
    @ride.update(ride_params)
    if @ride.save
      redirect_to tribe_path(@tribe)
    else
      render "edit"
    end
  end

  def show
    if helpers.logged_in?
      @user = User.find(session[:user_id])
      @ride = Ride.find(params[:id])
      @ride_users = @ride.users.uniq
      @user_ride = UserRide.new(user_id: @user.id, ride_id: @ride.id)
      @user_rides = UserRide.all
      @milestones = @user_rides.collect { |ride| ride.milestone }.uniq.compact
      if params[:tribe_id]
        @tribe = Tribe.find(params[:tribe_id])
      else
        @tribe = Tribe.find(@ride.tribe_id)
      end
    else
      redirect_to "/"
    end
  end

  def join_ride
    @user = User.find(session[:user_id])
    @ride = Ride.find(params[:id])
    @user.rides << @ride
    @user.save
    redirect_to tribe_path(@ride.tribe)
  end

  def destroy
    @user = User.find(session[:user_id])
    @ride = Ride.find(params[:id])
    @tribe = @ride.tribe
    @ride.delete
    redirect_to tribe_path(@tribe)
  end

  private

  def ride_params
    params.require(:ride).permit(:instructor, :date, :time, :duration, :format, :tribe_id, :original_date, :original_time)
  end
end
