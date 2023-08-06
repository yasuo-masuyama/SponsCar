class AdvertisementsController < ApplicationController
  before_action :get_all_genre_records, only: %i[ index show genre_index favorite_index ]
  before_action :set_current_driver, only: %i[ index show favorite_index ]
  before_action :set_current_sponsor, only: %i[ index show ]

  def index
    @advertisements = Advertisement.page(params[:page]).per(9)
  end

  def show
    @advertisement = Advertisement.includes(:sponsor, :genre).find(params[:id])
    @room = Room.find_by(advertisement_id: @advertisement.id, driver_id: current_driver.id)

    @under_deal = UnderDeal.new
  end

  def genre_index
    advertisements = Advertisement.where(genre_id: params[:id])
    @advertisements = advertisements.page(params[:page]).per(9)
    @genre = Genre.find(params[:id])
  end

  def favorite_index
    advertisements = Advertisement.joins(:favorites).where(favorites: { driver: @driver })
    @advertisements = advertisements.page(params[:page]).per(9) 
  end

  private

  def get_all_genre_records
    @genres = Genre.all
  end

  def set_current_driver
    @driver = current_driver
  end

  def set_current_sponsor
    @sponsor = current_sponsor
  end
end
