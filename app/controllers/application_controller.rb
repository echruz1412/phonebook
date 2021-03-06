class ApplicationController < ActionController::Base
  before_action :authenticate_user!, :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  def current_ability
	 @current_ability ||= Ability.new(current_user)
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :encrypted_password, :admin])
    devise_parameter_sanitizer.permit(:account_update, keys: [:email, :encrypted_password, :admin])
  end

end
