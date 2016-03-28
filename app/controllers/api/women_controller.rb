class Api::WomenController < ApplicationController
  private

  def parent
    @room ||= Room.find(params[:room_id])
  end

  def collection
    @women ||= parent.women
  end
end
