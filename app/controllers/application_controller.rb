class ApplicationController < ActionController::Base
  before_action :configure_permitted_paramiters, if: :devise_controller?

  protected

  def configure_permitted_paramiters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:avatar, :email, :password, :password_confirmation, :current_password])
  end
end
