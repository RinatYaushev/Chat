class Api::MessagesController < ApplicationController
  load_and_authorize_resource :room
  load_and_authorize_resource :message, through: :room

  private

  def parent
    @room ||= Room.find(params[:room_id])
  end

  def collection
    @messages ||= parent.messages
  end

  def resource
    @message ||= collection.find(params[:id])
  end

  def build_resource
    @message = collection.new(resource_params)
  end

  def resource_params
    params.require(:message).permit(:content).merge(user: current_user)
  end
end
