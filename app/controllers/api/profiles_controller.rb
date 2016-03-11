class Api::ProfilesController < ApplicationController
  private

  def resource
    @profile ||= current_user
  end

  def resource_params
    params.require(:profile).permit(:name, :password, :password_confirmation)
  end
end
