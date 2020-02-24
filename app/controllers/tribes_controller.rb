class TribesController < ApplicationController
  def index
    @tribes = Tribe.all
  end

  def new
    @tribe = Tribe.new
  end

  def create
    @tribe=Tribe.new(tribe_params)
    @tribe.save
    redirect_to tribe_path(@tribe)
  end

  def show
    @tribe=Tribe.find(params[:id])
  end

  private

  def tribe_params
    params.require(:tribe).permit(:name, :image_url, :url)
    end

end
