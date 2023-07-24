class DriversController < ApplicationController
  before_action :authenticate_driver!, only: %i[ dashboard edit update]
  before_action :set_driver, only: %i[ dashboard edit update ]

  def dashboard
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

  private

  def set_driver
    @driver = Driver.find(params[:id])
  end

  def driver_params
    params.require(:driver).permit(:name, :name_kana, :profile_image, :postal_code, :address, :telephone_number, :is_active, :activity_area)
  end
end
