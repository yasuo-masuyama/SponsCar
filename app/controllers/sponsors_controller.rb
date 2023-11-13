class SponsorsController < ApplicationController
  before_action :authenticate_sponsor! || :authenticate_admin!, only: %i[ dashboard edit update ]
  before_action :set_sponsor, only: %i[ show edit update followings followers ]
  before_action :set_current_driver, only: %i[ dashboard index ]
  before_action :set_current_sponsor, only: %i[ dashboard index ]

  def dashboard
    deal_all = UnderDeal.includes(:advertisement).where(advertisements: {sponsor_id: current_sponsor} )
    @under_deals = deal_all.includes(:advertisement).where.not(work_status: ['finished', 'checked_refuse'])
    @finish_deals = deal_all.where(work_status: 'finished').or(deal_all.where(work_status: 'refuse')).or(deal_all.where(work_status: 'checked_refuse'))
    @rooms = Room.includes(:advertisement).where(sponsor: @sponsor)
  end

  def index
    @sponsors = Sponsor.with_attached_company_image.page(params[:page]).per(9)
  end

  def show
  end

  def edit
  end

  def update
    if @sponsor.update(sponsor_params)
      redirect_to edit_sponsor_path
    else
      render :edit
    end
  end

  def followings
    @followings = @sponsor.following_driver
  end

  def followers
    @followers = @sponsor.follower_driver
  end

  private

  def set_current_driver
    @driver = current_driver
  end

  def set_current_sponsor
    @sponsor = current_sponsor
  end

  def set_sponsor
    @sponsor = Sponsor.find(params[:id])
  end

  def sponsor_params
    params.require(:sponsor).permit(:company_name, :company_name_kana, :ceo_name, :ceo_name_kana, :postal_code, :address, :telephone_number, :is_active, :company_image, :email)
  end
end