class SponsorsController < ApplicationController
  before_action :authenticate_sponsor! || :authenticate_admin!, only: %i[ dashboard edit update ]
  before_action :set_sponsor, only: %i[ show edit update ]

  def dashboard
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

  private

  def set_sponsor
    @sponsor = Sponsor.find(params[:id])
  end

  def sponsor_params
    params.require(:sponsor).permit(:company_name, :company_name_kana, :ceo_name, :ceo_name_kana, :postal_code, :address, :telephone_number, :is_active, :company_image, :email)
  end
end
