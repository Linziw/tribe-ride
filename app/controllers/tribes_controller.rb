class TribesController < ApplicationController

  def index
    if helpers.logged_in?
      set_user
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
    @tribe.owner_id = @user.id
    if @tribe.save
      @user.tribes << @tribe
      redirect_to tribe_path(@tribe)
    else
      render "new"
    end
  end

  def show
    if helpers.logged_in?
      set_tribe
      set_user
      @users = @tribe.users.uniq
      @rides_sorted = @tribe.rides.upcoming.sort_by { |r| r["date"] }
    else
      redirect_to "/"
    end
  end

  def edit
    if helpers.logged_in?
      set_tribe
      set_user
      if !@tribe.owner?(@user)
        redirect_to tribe_path(@tribe)
      end
    else
      redirect_to "/"
    end
  end

  def update
    set_tribe
    @tribe.update(tribe_params)
    if @tribe.save
      redirect_to tribe_path(@tribe)
    else
      render "edit"
    end
  end

  def destroy
    set_user
    set_tribe
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

  def set_user
    @user = User.find(session[:user_id])
  end

  def set_tribe
    if !params[:tribe_id] == nil
    @tribe = Tribe.find(params[:tribe_id])
    else
      @tribe = Tribe.find(params[:id])
    end
  end

end
