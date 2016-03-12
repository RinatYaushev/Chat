class Api::RoomsController < ApplicationController
  load_and_authorize_resource

  skip_load_resource only: :create

  private

  def collection
    @rooms ||= current_user.rooms
  end

  def build_resource
    @room = Room.build(current_user, resource_params)
  end

  def resource
    @room ||= Room.find(params[:id])
  end

  def resource_params
    params.require(:room).permit(:name, user_ids: [])
  end
end
