class FavoritesController < ApplicationController
  before_action :authenticate_driver!
  before_action :set_advertisement, only: %i[ create destroy ]

  def create
    favorite = current_driver.favorites.new(advertisement_id: @advertisement.id)
    favorite.save
  end

  def destroy
    favorite = current_driver.favorites.find_by(advertisement_id: @advertisement.id)
		favorite.destroy
  end

  private

  def set_advertisement
    @advertisement = Advertisement.find(params[:advertisement_id])
  end
end
