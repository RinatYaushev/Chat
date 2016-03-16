class Api::PingsController < ApplicationController
  load_and_authorize_resource :room

  load_and_authorize_resource :ping, through: :room

  skip_load_resource :ping, through: :room, only: :create

  private

  def parent
    @room
  end

  def collection
    @pings ||= parent.pings
  end

  def build_resource
    @ping = collection.new(user: current_user)
  end

  def resource
    @ping
  end
end
