class Sponsors::AdvertisementsController < ApplicationController
  before_action :set_advertisement, only: %i[ show edit update ]
  before_action :getAllGenreRecords, only: %i[ index new edit]

  def index
    @sponsor = current_sponsor
    @advertisements = @sponsor.advertisements.page(params[:page]).per(9)
  end

  def new
    @advertisement = Advertisement.new
  end

  def create
    @advertisement = Advertisement.new(advertisement_params)
    @advertisement.sponsor_id = current_sponsor.id
    if @advertisement.save
      redirect_to sponsor_advertisement_path(@advertisement.sponsor_id, @advertisement.id)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @advertisement.update(advertisement_params)
      redirect_to sponsor_advertisements_path
    else
      render :edit
    end
  end

  private

  def set_advertisement
    @advertisement = Advertisement.find(params[:id])
  end

  def advertisement_params
    params.require(:advertisement).permit(:sponsor_id, :genre_id, :title, :content, :heading, :image, :amounts, :is_active, :start_due_on, :end_due_on)
  end

  def getAllGenreRecords
    @genres = Genre.all
  end
end
