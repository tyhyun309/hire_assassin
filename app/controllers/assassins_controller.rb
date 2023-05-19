class AssassinsController < ApplicationController
  def index
    # @assassins = Assassin.all
    @assassins = policy_scope(Assassin)
    return unless params[:query].present?

    @assassins = @assassins.search_by_name_weapon_description(params[:query])
  end

  def show
    set_assassin
    authorize(@assassin)
    @booking = Booking.new
    @score = 0
    @assassin.bookings.each do |booking|
      @score += booking.rating if booking.status == 'Completed' && booking.rating.present?
    end
    @score /= @assassin.bookings.select { |booking| booking.rating.present? }.count
    @score = @score.round(2)
  end

  def edit
    set_assassin
    authorize(@assassin)
  end

  def update
    set_assassin
    authorize(@assassin)
    @assassin.update(assassin_params)

    if @assassin.save
      redirect_to assassin_path(@assassin)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def new
    @assassin = Assassin.new
    authorize(@assassin)
    if @assassin.save
      redirect_to assassins_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def create
    @assassin = Assassin.new(assassin_params)
    @assassin.user = current_user
    authorize(@assassin)
    if @assassin.save
      redirect_to assassin_my_a_bookings_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_assassin
    @assassin = Assassin.find(params[:id])
  end

  def assassin_params
    params.require(:assassin).permit(:name, :weapon, :description, :price, :photo)
  end
end
