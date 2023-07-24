class TransferInfosController < ApplicationController
  before_action :authenticate_driver!
  before_action :set_transfer_info, only: %i[ edit update destroy]

  def index
    @transfer_info = TransferInfo.new
    @transfer_infos = current_driver.transfer_infos
  end

  def create
    @transfer_info = TransferInfo.new(transfer_info_params)
    @transfer_info.driver_id = current_driver.id
    if @transfer_info.save
      redirect_to driver_transfer_infos_path(current_driver)
    else
      @transfer_info = current_driver.transfer_infos
      render :index
    end
  end

  def edit
  end

  def update
    if @transfer_info.update(transfer_info_params)
      redirect_to driver_transfer_infos_path(current_driver)
    else
      render :edit
    end
  end

  def destroy
    @transfer_info.destroy
    redirect_to driver_transfer_infos_path(current_driver)
  end

  private

  def set_transfer_info
    @transfer_info = TransferInfo.find(params[:id])
  end

  def transfer_info_params
    params.require(:transfer_info).permit(:driver_id, :bank_name, :branch_name, :account_number, :account_type, :account_name)
  end
end
