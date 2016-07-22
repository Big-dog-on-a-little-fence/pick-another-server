class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # Note: "current_user" is already a helper method with devise
  
  include PublicActivity::StoreController
  
  # helper_method :generate_tune
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  # def generate_tune(tunes, current_tunes)
  #   if current_tunes.empty?
  #     current_tunes = tunes.dup
  #   end
  #   tunes.pop
  # end
  
  protected

  def configure_permitted_parameters
    added_attrs = [:username, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
  
end

