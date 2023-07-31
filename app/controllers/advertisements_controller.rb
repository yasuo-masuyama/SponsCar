class AdvertisementsController < ApplicationController
  before_action :getAllGenreRecords, only: %i[ index show genre_index favorite_index ]
  before_action :set_current_driver, only: %i[ index show favorite_index ]
  before_action :set_current_sponsor, only: %i[ index show ]
  # before_action :paginate_advertisements, only: %i[ genre_index favorite_index ]

  def index
    @advertisements = Advertisement.page(params[:page]).per(9)
  end

  def show
    @advertisement = Advertisement.includes(:sponsor, :genre).find(params[:id])
  end

  def genre_index
    advertisements = Advertisement.where(genre_id: params[:id])
    @advertisements = advertisements.page(params[:page]).per(9) # リファクタ検討
    @genre = Genre.find(params[:id])
  end

  def favorite_index
    advertisements = Advertisement.joins(:favorites).where(favorites: { driver: @driver })
    @advertisements = advertisements.page(params[:page]).per(9) # リファクタ検討
  end

  private

  def getAllGenreRecords
    @genres = Genre.all
  end

  def set_current_driver
    @driver = current_driver
  end

  def set_current_sponsor
    @sponsor = current_sponsor
  end

  # def paginate_advertisements
  #   @advertisements = advertisements.page(params[:page]).per(9)
  # end
end
