class DriversController < ApplicationController
  before_action :authenticate_driver!, only: %i[ dashboard edit update]
  before_action :set_driver, only: %i[dashboard]

  def dashboard
  end

  private

  def set_driver
    @driver = Driver.find(params[:id])
  end

  def driver_parms
    params.require(:driver).permit(:name, :name_kana, :profile_image, :postal_code, :address, :telephone_number, :is_active, :activity_area)
  end
end
