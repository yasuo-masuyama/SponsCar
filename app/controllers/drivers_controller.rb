class DriversController < ApplicationController
  before_action :authenticate_driver!, only: %i[ dashboard edit update]
  before_action :set_driver, only: %i[ dashboard edit update show followings followers ]
  before_action :set_current_sponsor, only: %i[ index show ]

  def dashboard
    set_dashboard_data
  end

  def index
    @driver = current_driver
    @drivers = Driver.with_attached_profile_image.page(params[:page]).per(9)
  end

  def show
    @genres = Genre.all
    @car_infos = @driver.car_infos
    @current_driver = current_driver
  end

  def edit
  end

  def update
    if @driver.update(driver_params)
      redirect_to edit_driver_path
    else
      render :edit
    end
  end

  def followings
    @followings = @driver.following_sponsor
  end

  def followers
    @followers = @driver.follower_sponsor
  end

  private

  def set_dashboard_data
    @under_deals = @driver.under_deals.includes(:advertisement)
    @under_deal = active_deal(@under_deals)
    @finish_deals = finished_deals(@under_deals)

    if @under_deal.present?
      @advertisement = @under_deal.advertisement
      @deal_messages = @under_deal.deal_messages
      @deal_message = DealMessage.new
      @deal_detail = DealDetail.new(deal_detail_params)
    end
  end

  def active_deal(deals)
    deals.where.not(work_status: %w[finished checked_refuse]).first
  end

  def finished_deals(deals)
    deals.where(work_status: %w[finished checked_refuse])
  end

  def set_current_sponsor
    @sponsor = current_sponsor
  end

  def set_driver
    @driver = Driver.find(params[:id])
  end

  def driver_params
    params.require(:driver).permit(:name, :name_kana, :postal_code, :address, :telephone_number, :is_active, :activity_area, :profile_image, :license_image)
  end

  def deal_detail_params
    params.permit(:transfer_status, :bank_name, :branch_name, :account_type, :account_number, :account_name)
  end
end
