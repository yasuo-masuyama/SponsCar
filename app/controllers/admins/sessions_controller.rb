# frozen_string_literal: true

class Admins::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  def after_sign_in_path_for(resource)
    admins_path
  end

  def guest_sign_in
    admin = Admin.guest
    sign_in admin
    redirect_to admins_path, notice: 'ゲストユーザーとしてログインしました。'
  end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_outC
  # def destroy
  #   super
  # end

  def after_sign_out_path_for(resource)
    new_admin_session_path
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
