class Api::UsersController < ApplicationController
  skip_before_action :authenticate, only: :create

  private

  def parent
    @room ||= Room.find(params[:room_id])
  end

  def collection
    @users ||= parent.users
  end

  def build_resource
    @user = User.new(resource_params)
  end

  def resource
    @user ||= User.find(params[:id])
  end

  def resource_params
    params.require(:user).permit(:email, :name, :password, :password_confirmation, :phone, :gender)
  end
end
