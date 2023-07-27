class AdvertisementsController < ApplicationController

  def index
    @advertisements = Advertisement.page(params[:page]).per(9)
    @driver = current_driver
    @sponsor = current_sponsor
    @genres = Genre.all
  end

  def show
    @advertisement = Advertisement.includes(:sponsor, :genre).find(params[:id])
    @driver = current_driver
    @sponsor = current_sponsor
    @genres = Genre.all
  end
end
