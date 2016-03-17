class Api::ProfilesController < ApplicationController
  private

  def resource
    @user ||= current_user
  end

  def resource_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
