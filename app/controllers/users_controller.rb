class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user=User.new(user_params)
    if @user.valid?
      @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def facebook_create
    @user = User.find_or_create_by(uid: auth['uid']) do |u|
      u.name = auth['info']['name']
      u.email = auth['info']['email']
      u.password = SecureRandom.urlsafe_base64
    end
    session[:user_id] = @user.id
    redirect_to user_path(@user)
  end


  def show
   if helpers.logged_in?
      @user=User.find(session[:user_id])
      @user_tribes = @user.tribes.uniq
      @rides = @user.member_participating_upcoming
      @rides_sorted = @rides.sort_by { |r| r['date'] }
    else
      redirect_to '/'
    end
  end


  def update
    @user=User.find(session[:user_id])
    @user.update(user_params)
    if @user.valid?
    redirect_to user_path(@user)
    else
      render 'edit'
    end
  end


  def edit
    if helpers.logged_in?
    @user=User.find(session[:user_id])
    else
      redirect_to '/'
    end
  end

  def index
    if helpers.logged_in?
      @tribe = Tribe.find(params[:tribe_id])
      @users = @tribe.users.uniq
    else
      redirect_to '/'
    end
  end

  def destroy
    @user=User.find(session[:user_id])
    @user.destroy
    session.delete(:user_id)
    redirect_to "/"
  end

  
  private

  def user_params
  params.require(:user).permit(:name, :password, :email, :peloton_name, :admin, :uid)
  end

  def auth
    request.env['omniauth.auth']
  end

end
