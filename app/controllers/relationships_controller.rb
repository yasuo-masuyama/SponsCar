class RelationshipsController < ApplicationController
  before_action :set_driver, only: %i[ create destroy ]
  
  def create
    current_sponsor.follow(params[:driver_id])
  end

  def destroy
    current_sponsor.unfollow(params[:driver_id])
  end

  private

  def set_driver
    @driver = Driver.find(params[:driver_id])
  end
end
