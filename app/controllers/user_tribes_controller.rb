class UserTribesController < ApplicationController

  def edit
    @user=User.find(session[:user_id])
    @tribes=Tribe.all
  end

  def update
    @user=User.find(session[:user_id])
    @user.tribe_ids = user_tribes_params[:tribe_ids]
    @user.save
  redirect_to user_path(@user)
  end

  def destroy
    @user=User.find(session[:user_id])
    @tribe=Tribe.find(params[:id])
    if @tribe.owner?(@user)
      redirect_to tribe_path(@tribe)
    else
     @user.tribes.delete(@tribe)
    redirect_to user_path(@user)
    end
  end

  private

  def user_tribes_params
  params.require(:user).permit(tribe_ids:[])
  end


 
end
