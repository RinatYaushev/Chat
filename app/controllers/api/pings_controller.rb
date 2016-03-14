class Api::PingsController < ApplicationController
  load_and_authorize_resource :room
  load_and_authorize_resource :ping, through: :room

  private

  def parent
    @room ||= Room.find(params[:room_id])
  end

  def collection
    @pings ||= parent.pings
  end

  def build_resource
    @ping = collection.new(resource_params)
  end

  def resource
    @ping ||= collection.find(params[:id])
  end

  def resource_params
    params.require(:ping).permit(:content).merge(user: current_user)
  end
end
