class AdvertisementsController < ApplicationController
  before_action :getAllGenreRecords, only: %i[ index show genre_index ]
  before_action :set_current_driver, only: %i[ index show ]
  before_action :set_current_sponsor, only: %i[ index show ]

  def index
    @advertisements = Advertisement.page(params[:page]).per(9)
  end

  def show
    @advertisement = Advertisement.includes(:sponsor, :genre).find(params[:id])
  end

  def genre_index
    advertisements = Advertisement.where(genre_id: params[:id])
    @advertisements = advertisements.page(params[:page]).per(9)
    @genre = Genre.find(params[:id])
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
end
