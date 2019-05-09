# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  protected
  def after_sign_up_path_for resource
    home_path
  end

  def after_inactive_sign_up_path_for resource
    home_path
  end

  private
  def sign_up_params
    params.require(:user).permit(
      :name,
      :email,
      :password,
      :password_confirmation
    )
  end
end
