class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit({ roles: [] }, :email, :password, :password_confirmation) }
  end
end




=begin

SEVEN SECURITY TIPS:

1) Mass assignment Or Strong parameters
2) Password has to be FILTERED
3) SQL injection
4) Need to use h for displaying Html element (html_safe)
5) Validation must be there during file upload
6) No permission to access others data
7) Cross site forgery protection(csrf_meta_tag)
=end
