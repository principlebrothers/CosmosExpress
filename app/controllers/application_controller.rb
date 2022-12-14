class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user!
  before_action :update_allowed_parameters, if: :devise_controller?

  # To redirect users to see all users after sign up
  def after_sign_up_path_for(_resource)
    users_path
  end

  # Determine where to redirect user after successful login.
  def after_sign_in_path_for(_resource)
    user_path(current_user)
  end

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :photo, :bio, :email, :password) }
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:name, :photo, :bio, :email, :password, :current_password)
    end
  end
end
