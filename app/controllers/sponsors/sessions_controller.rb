# frozen_string_literal: true

class Sponsors::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  def guest_sign_in
    sponsor = Sponsor.guest
    sign_in sponsor
    redirect_to dashboard_sponsor_path(current_sponsor), notice: 'ゲストユーザーとしてログインしました。'
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  def after_sign_in_path_for(resource)
    dashboard_sponsor_path(resource)
  end

  def after_sign_out_path_for(resource)
    new_sponsor_session_path
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
