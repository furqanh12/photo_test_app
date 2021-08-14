class ApplicationController < ActionController::Base
  before_action :logged_in
  before_action :configure_permitted_parameters, if: :devise_controller?

  def logged_in
  	@logged_in_user = current_user
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :profile_url])
  end
end
