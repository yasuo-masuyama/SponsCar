class DealMessagesController < ApplicationController
  def create
    @under_deal = UnderDeal.find(params[:under_deal_id])
    @deal_message = @under_deal.deal_messages.build(deal_message_params.merge(user_type: determine_user_type))
    @deal_message.save
    redirect_back(fallback_location: under_deal_path(@under_deal))
  end

  private

  def determine_user_type
    return 'driver' if driver_signed_in?
    return 'sponsor' if sponsor_signed_in?
  end

  def deal_message_params
    params.require(:deal_message).permit(:message)
  end
end
