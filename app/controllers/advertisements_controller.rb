class AdvertisementsController < ApplicationController
  before_action :set_genres, only: %i[ index show genre_index favorite_index ]
  before_action :set_current_user, only: %i[ index show favorite_index ]

  def index
    @advertisements = Advertisement.paginate(params[:page])
  end

  def show
    @advertisement = find_advertisement_with_associations
    @room = Room.find_by(advertisement_id: @advertisement.id, driver_id: current_driver.id)
    @under_deal = UnderDeal.new
  end

  def genre_index
    @advertisements = Advertisement.of_genre(params[:id]).paginate(params[:page])
    @genre = Genre.find(params[:id])
  end

  def favorite_index
    @advertisements = Advertisement.favorites_of(@driver).paginate(params[:page])
  end

  private

  def set_genres
    @genres = Genre.all
  end

  def set_current_user
    @driver = current_driver
    @sponsor = current_sponsor if action_name.in?(['index', 'show'])
  end

  def find_advertisement_with_associations
    Advertisement.includes(:sponsor, :genre).find(params[:id])
  end
end
