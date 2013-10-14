class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


# this allows to allow for name and profile pic to save
before_action :configure_permitted_parameters, if: :devise_controller?
#makes sure a user is logged in before any action can be taken
before_action :authenticate_user!

protected

def configure_permitted_parameters
  devise_parameter_sanitizer.for(:account_update) << :name
  devise_parameter_sanitizer.for(:account_update) << :profile_pic
  devise_parameter_sanitizer.for(:sign_up) << :name
  devise_parameter_sanitizer.for(:sign_up) << :profile_pic
end


end
