class ApplicationController < ActionController::Base
    helper AlbumsHelper, PhotosHelper, UsersHelper

    before_action :configure_permitted_parameters, if: :devise_controller?
    @param_list = [:first_name, :last_name, :email, :password, :password_confirmation, :current_password, :status, :avatar, :file, :images_cache]
    private
    def authenticate_user!(opts={})
      if user_signed_in?
        super
      else
        permit_path = [root_path, new_user_session_path, new_user_registration_path]
        unless request.original_fullpath.in? permit_path
          redirect_to root_path, notice: "Please Login to view that page!" 
        end
      end
    end
    protected
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :email, :password, :password_confirmation, :status, :images_cache])
        devise_parameter_sanitizer.permit(:sign_in, keys: [:firstname, :lastname, :email, :password, :password_confirmation, :images_cache])
        devise_parameter_sanitizer.permit(:account_update, keys: @param_list)
    end
end
