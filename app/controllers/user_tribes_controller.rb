class UserTribesController < ApplicationController

  def edit
    @user=User.find(session[:user_id])
    @tribes=Tribe.all
  end

  def update
    @user=User.find(session[:user_id])
    @user.tribe_ids = params[:tribe_ids]
    @user.save
  redirect_to user_path(@user)
  end


 
end
