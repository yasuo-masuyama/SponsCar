class RoomsController < ApplicationController
  before_action :set_advertisement, only: %i[ index create ]

  def index
		@rooms = Room.joins(:driver, :advertisement).where(advertisement_id: @advertisement.id, sponsor_id: current_sponsor.id)
	end

	def show
		@advertisement = Advertisement.includes(:sponsor).find(params[:advertisement_id])
		@driver = Room.includes(:driver).find(params[:id])
		if driver_signed_in?
			@room = Room.find_by(advertisement_id: @advertisement.id, driver_id: @driver.driver.id)
		else
			@room = Room.find_by(advertisement_id: @advertisement.id, driver_id: @driver.driver.id, sponsor_id: current_sponsor.id)
		end

		@chats = @room.chats.order("id DESC")

		@chat = Chat.new(room_id: @room.id)
	end

	def create
		@room = Room.create(advertisement_id: @advertisement.id, driver_id: current_driver.id, sponsor_id: @advertisement.sponsor_id)
    redirect_to advertisement_room_path(@advertisement.id,@room.id)
	end

  private

  def set_advertisement
    @advertisement = Advertisement.find(params[:advertisement_id])
  end
end