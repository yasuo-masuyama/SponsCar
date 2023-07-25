class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protect_from_forgery with: :exception

  protected

  def configure_permitted_parameters
    if resource_class == Driver
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :name_kana, :postal_code, :address, :telephone_number, :activity_area, :terms, :email, :profile_image, :license_image])
    elsif resource_class == Sponsor
      devise_parameter_sanitizer.permit(:sign_up,keys:[:company_name, :company_name_kana, :ceo_name, :ceo_name_kana, :postal_code, :address, :telephone_number, :terms, :is_active])
    else
      devise_parameter_sanitizer.permit(:sign_up,keys:[:name,:name_kana,:email])
    end
  end
end


