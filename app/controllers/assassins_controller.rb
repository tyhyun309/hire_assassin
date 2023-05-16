class AssassinsController < ApplicationController
  def index
    # @assassins = Assassin.all
    @assassins = policy_scope(Assassin)
  end

  def show
    @assassin = Assassin.find(params[:id])
    authorize @assassin
    @booking = Booking.new
  end

  def edit
    @assassin = Assassin.find(params[:id])
  end

  def update
    @assassin = Assassin.find(params[:id])
    @assassin.update(assassin_params)
    redirect_to assassin_path(:assassin)
  end

  def assassin_params
    params.require(:assassin).permit(:photo)
  end
end
