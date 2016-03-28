class Api::ProfilesController < ApplicationController
  private

  def resource
    @user ||= current_user
  end

  def resource_params
    params.require(:user).permit(:email, :name, :password, :password_confirmation, :phone, :gender)
  end
end
