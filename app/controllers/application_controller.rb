class ApplicationController < ActionController::Base
  protect_from_forgery prepend: true

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name])
  end
end
