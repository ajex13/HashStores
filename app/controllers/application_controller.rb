class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

rescue_from CanCan::AccessDenied do
  redirect_to root_path, alert: "you are not authorized to access this page"
end



protected
def configure_permitted_parameters
  devise_parameter_sanitizer.permit(:sign_up,keys: [:username])

end
end
