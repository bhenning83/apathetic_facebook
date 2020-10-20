class ApplicationController < ActionController::Base
  before_action :configure_permitted_paramiters, if: :devise_controller?
  # before_action :masquerade_user!

  protected

  def configure_permitted_paramiters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :avatar])
  end
end
