class RelationshipDriversController < ApplicationController
  before_action :set_sponsor, only: %i[ create destroy ]

  def create
    current_driver.follow(params[:sponsor_id])
  end

  def destroy
    current_driver.unfollow(params[:sponsor_id])
  end

  private

  def set_sponsor
    @sponsor = Sponsor.find(params[:sponsor_id])
  end
end
