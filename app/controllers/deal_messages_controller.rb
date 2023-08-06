class DealMessagesController < ApplicationController
  def create
		@under_deal = UnderDeal.find(params[:under_deal_id])
		@deal_message = DealMessage.new(deal_message_params)
		if driver_signed_in?
			@deal_message.user_type = 'driver'
		elsif sponsor_signed_in?
			@deal_message.user_type = 'sponsor'
		end
		@deal_message.under_deal_id = @under_deal.id
		@deal_message.save
		redirect_back(fallback_location: under_deal_path(@under_deal))
	end

	private

	def deal_message_params
		params.require(:deal_message).permit(:message, :user_type, :under_deal_id)
	end
end
