class Api::UsersController < ApplicationController
  skip_before_action :authenticate, only: [:index, :create]

  load_and_authorize_resource

  private

  def resource
    @user ||= User.find(params[:id])
  end

  def build_resource
    @user = User.new(resource_params)
  end

  def resource_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
