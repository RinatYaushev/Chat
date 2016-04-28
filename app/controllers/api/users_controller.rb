class Api::UsersController < ApplicationController
  skip_before_action :authenticate, only: :create

  private

  def parent
    @room ||= Room.find(params[:room_id])
  end

  def collection
    @users ||= end_of_association_chain.search_by(params)
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

  def end_of_association_chain
    if params[:room_id].present?
      parent.users
    else
      User.order(:id)
    end
  end
end
