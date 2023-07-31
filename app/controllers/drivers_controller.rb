class DriversController < ApplicationController
  before_action :authenticate_driver!, only: %i[ dashboard edit update]
  before_action :set_driver, only: %i[ dashboard edit update show followings followers ]
  before_action :set_current_sponsor, only: %i[ index show ]

  def dashboard
  end

  def index
    @driver = current_driver
    @drivers = Driver.page(params[:page]).per(9)
  end

  def edit
  end

  def show
    @genres = Genre.all
    @car_infos = @driver.car_infos
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

  def set_current_sponsor
    @sponsor = current_sponsor
  end

  def set_driver
    @driver = Driver.find(params[:id])
  end

  def driver_params
    params.require(:driver).permit( :name, :name_kana, :postal_code, :address, :telephone_number, :is_active, :activity_area, :profile_image, :license_image) 
  end
end
