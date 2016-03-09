class Api::RoomsController < ApplicationController
  load_and_authorize_resource

  private

  def collection
    @rooms ||= current_user.rooms
  end

  def resource
    @room ||= Room.find(params[:id])
  end

  def build_resource
    @room = RoomBuilder.new(current_user, resource_params)
  end

  def resource_params
    params.require(:room).permit(:name, user_ids: [])
  end
end
