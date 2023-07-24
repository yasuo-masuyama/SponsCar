class CarInfosController < ApplicationController
  before_action :authenticate_driver!
  before_action :set_car_info, only: %i[ edit update destroy ]

  def index
    @car_info = CarInfo.new
    @car_infos = current_driver.car_infos
  end

  def create
    @car_info = CarInfo.new(car_info_params)
    @car_info.driver_id = current_driver.id
    if @car_info.save
      redirect_to driver_car_infos_path(current_driver)
    else
      @car_infos = current_driver.car_infos
      render :index    
    end
  end

  def edit
  end

  def update
    if @car_info.update(car_info_params)
      redirect_to driver_car_infos_path(current_driver)
    else
      render :edit
    end
  end

  def destroy
    @car_info.destroy
    redirect_to driver_car_infos_path(current_driver)
  end

  private

  def set_car_info
    @car_info = CarInfo.find(params[:id])
  end

  def car_info_params
    params.require(:car_info).permit(:driver_id, :manufacturer_name, :name, :flame_number, :license_plate, :vehicle_image)
  end
end
