# frozen_string_literal: true

class Drivers::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  def guest_sign_in
    driver = Driver.guest
    sign_in driver
    redirect_to dashboard_driver_path(current_driver)
  end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  def after_sign_in_path_for(resource)
    dashboard_driver_path(resource)
  end

  def after_sign_out_path_for(resource)
    new_driver_session_path
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
