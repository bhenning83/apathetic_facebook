class ApplicationController < ActionController::Base
  before_action :configure_permitted_paramiters, if: :devise_controller?
  # before_action :masquerade_user!

  helper_method :current_user
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  protected

  def configure_permitted_paramiters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :avatar])
  end
end
