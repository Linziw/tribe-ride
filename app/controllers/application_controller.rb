class ApplicationController < ActionController::Base
  before_action :require_login

  private

  def require_login
    unless helpers.logged_in?
      flash[:error] = "You must be logged in to access this section"
      redirect_to '/'
    end
  end

end
