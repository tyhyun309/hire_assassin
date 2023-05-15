class AssassinsController < ApplicationController
  def index
    @assassins = Assassin.all
  end

  def show
    @assassin = Assassin.find(params[:id])
  end

  def edit
    @assassin = Assassin.find(params[:id])
  end

  def update
    @assassin = Assassin.find(params[:id])
    @assassin.update(params[:assassin])
    redirect_to assassin_path(@assassin)
  end
end
