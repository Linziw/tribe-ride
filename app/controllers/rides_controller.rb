class RidesController < ApplicationController
  def new
    if helpers.logged_in?
      set_user
      set_tribe
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
    @ride = Ride.ride_creator(ride_params)
    if @ride.save
      redirect_to "/tribes/#{ride_params[:tribe_id]}"
    else
      render "new"
    end
  end

  def edit
    if helpers.logged_in?
      set_user
      set_tribe
      set_ride
    else
      redirect_to "/"
    end
  end

  def update
    set_user
    set_ride
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
      set_user
      set_ride
      @ride_users = @ride.users.uniq
      @user_ride = UserRide.new(user_id: @user.id, ride_id: @ride.id)
      @user_rides = UserRide.all
      @milestones = @user_rides.collect { |ride| ride.milestone }.uniq.compact
      if params[:tribe_id]
        set_tribe
      else
        @tribe = Tribe.find(@ride.tribe_id)
      end
    else
      redirect_to "/"
    end
  end

  def join_ride
    set_user
    set_ride
    @user.rides << @ride
    @user.save
    redirect_to tribe_path(@ride.tribe)
  end

  def destroy
    set_user
    set_ride
    @tribe = @ride.tribe
    @ride.delete
    redirect_to tribe_path(@tribe)
  end

  private

  def ride_params
    params.require(:ride).permit(:instructor, :date, :time, :duration, :format, :tribe_id, :original_date, :original_time)
  end

  def set_user
    @user = User.find(session[:user_id])
  end

  def set_tribe
    @tribe = Tribe.find(params[:tribe_id])
  end

  def set_ride
    @ride = Ride.find(params[:id])
  end


end
