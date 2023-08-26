class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:top, :about]
  # skip_before_action :authenticate_user!, only: [:about] # aboutアクションに対してフィルターを適用しない
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def after_sign_in_path_for(resource)
    user_path(resource)
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end
end