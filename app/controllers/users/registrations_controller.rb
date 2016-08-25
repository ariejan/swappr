class Users::RegistrationsController < Devise::RegistrationsController

  protected

  # The path used after sign up.
  def after_sign_up_path_for(resource)
    after_signup_path(:profile)
  end

end
