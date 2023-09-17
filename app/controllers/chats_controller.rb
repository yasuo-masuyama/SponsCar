class ChatsController < ApplicationController
  def index
		@advertisement = Advertisement.includes(:sponsor).find(params[:sponsor_id])
		room = Room.find_by(advertisement_id: @advertisement.id, driver_id: current_driver.id)
			if room.nil?
				room = Room.create(advertisement_id: @advertisement.id, driver_id: current_driver.id, sponsor_id: @advertisement.sponsor_id)
			end
		@chats = room.chats.order("id DESC")
		@chat = Chat.new(room_id: room.id)
	end

	def create
		@chat = Chat.new(chat_params)
		@chat.save
		redirect_back(fallback_location: root_path)
	end

	private
	
	def chat_params
		params.require(:chat).permit(:room_id, :user_type, :message)
	end
end
