class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:user_type, :email, :password,:password_confirmation)}

    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:user_type,:email, :password, :password_confirmation)}
  end

    rescue_from CanCan::AccessDenied do |exception|
      redirect_to root_url, alert: exception.message
    end

end
