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
    @ping = collection.new(user: current_user)
  end

  def resource
    @ping ||= collection.find(params[:id])
  end
end
