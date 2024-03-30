class RegistrationsController < Devise::RegistrationsController
  skip_before_action :verify_authenticity_token
  skip_before_action :require_no_authentication, only: [:create]
  skip_before_action :authenticate_user!
end