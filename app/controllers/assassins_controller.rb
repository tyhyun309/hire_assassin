class AssassinsController < ApplicationController
  def index
    # @assassins = Assassin.all
    @assassins = policy_scope(Assassin)
    if params[:query].present?
      @assassins = @assassins.search_by_name_weapon_description(params[:query])
    end
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

  def new
    @assassin = Assassin.new
    authorize @assassin
  end

  def create
    @assassin = Assassin.new(assassin_params)
    @assassin.user = current_user
    authorize @assassin
    if @assassin.save
      redirect_to assassin_my_a_bookings_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def assassin_params
    params.require(:assassin).permit(:name, :weapon, :description, :price, :photo)
  end
end
