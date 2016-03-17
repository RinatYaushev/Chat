class Api::AvatarsController < ApplicationController
  private

  def resource
    @user ||= current_user
  end

  def resource_params
    params.require(:user).permit(:avatar)
  end
end
