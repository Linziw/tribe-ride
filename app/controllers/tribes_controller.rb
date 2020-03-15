class TribesController < ApplicationController

  def index
    if helpers.logged_in?
      @user = User.find(session[:user_id])
      @tribes = Tribe.all
    else redirect_to "/"     
    end
  end

  def new
    if helpers.logged_in?
      @tribe = Tribe.new
    else
      redirect_to "/"
    end
  end

  def create
    @user = User.find(session[:user_id])
    @tribe = Tribe.new(tribe_params)
    if @tribe.valid?
      @tribe.owner_id = @user.id
      @tribe.save
      @user.tribes << @tribe
      redirect_to tribe_path(@tribe)
    else
      render "new"
    end
  end

  def show
    if helpers.logged_in?
      @tribe = Tribe.find(params[:id])
      @user = User.find(session[:user_id])
      @users = @tribe.users.uniq
      @rides_sorted = @tribe.rides.upcoming.sort_by { |r| r["date"] }
    else
      redirect_to "/"
    end
  end

  def edit
    if helpers.logged_in?
      @tribe = Tribe.find(params[:id])
      @user = User.find(session[:user_id])
      if !@tribe.owner?(@user)
        redirect_to tribe_path(@tribe)
      end
    else
      redirect_to "/"
    end
  end

  def update
    @tribe = Tribe.find(params[:id])
    @tribe.update(tribe_params)
    if @tribe.valid?
      @tribe.save
      redirect_to tribe_path(@tribe)
    else
      render "edit"
    end
  end

  def destroy
    @user = User.find(session[:user_id])
    @tribe = Tribe.find(params[:id])
    if @tribe.owner?(@user) && @user.admin?
      @tribe.rides.destroy_all
      @tribe.destroy
      redirect_to user_path(@user)
    else
      redirect_to tribe_path(@tribe)
    end
  end

  private

  def tribe_params
    params.require(:tribe).permit(:name, :image_url, :url, :image)
  end
end
