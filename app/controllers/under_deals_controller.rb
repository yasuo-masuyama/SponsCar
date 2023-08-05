class UnderDealsController < ApplicationController

  def index
    @under_deals = UnderDeal.includes(:advertisement).where(advertisements: {sponsor_id: current_sponsor})
    @finish_deals = UnderDeal.includes(:advertisement, :deal_messages, :driver).references(:advertisement, :deal_messages, :driver).where(work_status: 'finished')
  end

  def show
    @under_deal = UnderDeal.includes(:advertisement, :driver, :deal_detail).includes(advertisement: :sponsor).find(params[:id])
    @advertisement = @under_deal.advertisement
    @messages = @under_deal.deal_messages
    @message = DealMessage.new()
    @deal_detail = DealDetail.new(deal_detail_params)
  end

  def show_driver
    @under_deal = UnderDeal.includes(:advertisement, :driver).includes(advertisement: :sponsor).find(params[:id])
    @advertisement = @under_deal.advertisement
    @messages = @under_deal.deal_messages
    @deal_detail = DealDetail.new(deal_detail_params)
  end

  def create
    @under_deal = UnderDeal.new(under_deal_params)
    if @under_deal.save
      redirect_to dashboard_driver_path(current_driver)
    else
      redirect_back(fallback_locatioln: advertisements_path)
    end
  end

  def update
    @under_deal = UnderDeal.find(params[:id])
    if params[:accept]
      @under_deal.work_status = 'waiting_kit'
      @under_deal.save
      redirect_back(fallback_location: under_deal_path(@under_deal))
    elsif params[:refuse]
      @under_deal.work_status = 'refuse'
      @under_deal.save
      redirect_back(fallback_location: under_deal_path(@under_deal))
    elsif params[:sent_kit]
      @under_deal.work_status = 'sent_kit'
      @under_deal.save
      redirect_back(fallback_location: under_deal_path(@under_deal))
    elsif params[:advertising]
      @under_deal.work_status = 'advertising'
      @under_deal.update(under_deal_params)
      redirect_back(fallback_location: under_deal_path(@under_deal))
    elsif params[:completed]
      # deal_detail(取引情報)のテーブルへ振込先の情報保存
      @deal_detail = DealDetail.new(deal_detail_params)
      @transfer_info = TransferInfo.find(params[:detail][:transfer_info_id])
      @deal_detail.under_deal_id = @under_deal.id
      @deal_detail.bank_name = @transfer_info.bank_name
      @deal_detail.branch_name = @transfer_info.branch_name
      @deal_detail.account_type = @transfer_info.account_type
      @deal_detail.account_number = @transfer_info.account_number
      @deal_detail.account_name = @transfer_info.account_name
      if @deal_detail.save
        @under_deal.work_status = 'completed'
        @under_deal.save
        redirect_back(fallback_location: under_deal_path(@under_deal))
      else
        redirect_back(fallback_location: under_deal_path(@under_deal))
      end
    elsif params[:transferred]
      @under_deal.work_status = 'transferred'
      @under_deal.save
      # deal_detail(取引情報)の広告料とテーブルへ振込の情報保存
      @deal_detail = @under_deal.deal_detail
      @deal_detail.transfer_status = 'transferred'
      @advertisement = UnderDeal.includes(:advertisement).find(params[:id])
      @deal_detail.payment_amount = @advertisement.advertisement.amounts
      @deal_detail.update(deal_detail_params)
      redirect_back(fallback_location: under_deal_path(@under_deal))
    elsif params[:rated]
      @under_deal.work_status = 'rated'
      @under_deal.save
      @deal_detail = @under_deal.deal_detail
      @deal_detail.transfer_status = 'checked'
      @deal_detail.update(deal_detail_params)
      redirect_back(fallback_location: under_deal_path(@under_deal))
    elsif params[:finished]
      @under_deal.work_status = 'finished'
      @under_deal.save
      redirect_back(fallback_location: under_deal_path(@under_deal))
    elsif params[:checked_refuse]
      @under_deal.work_status = 'checked_refuse'
      @under_deal.save
      redirect_to advertisements_path
    end
  end

  def coming_soon
  end

  private

  def under_deal_params
    params.require(:under_deal).permit(:advertisement_id, :driver_id, :work_status, :installation_image, :agreement)
  end

  def deal_message_params
    params.require(:deal_message).permit(:message, :user_type, :under_deal_id)
  end

  def deal_detail_params
    params.permit(:transfer_status, :bank_name, :branch_name, :account_type, :account_number, :account_name)
  end
end
