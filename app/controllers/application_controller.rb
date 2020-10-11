class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    # param_list = [:first_name, :last_name, :email, :password, :password_confirmation, :current_password, :status, :avatar, :file]

    private
    def authenticate_user!(opts={})
      if user_signed_in?
        super
      else
        redirect_to your_path, notice: "Please Login to view that page!" if request.original_fullpath != your_path
      end
    end
    protected
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :email, :password, :password_confirmation, :status])
        devise_parameter_sanitizer.permit(:sign_in, keys: [:firstname, :lastname, :email, :password, :password_confirmation])
        devise_parameter_sanitizer.permit(:account_update, keys:  [:first_name, :last_name, :email, :password, :password_confirmation, :current_password, :status, :avatar, :file])
    end
end
