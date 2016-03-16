class Api::MessagesController < ApplicationController
  load_and_authorize_resource :room

  load_and_authorize_resource :message, through: :room

  skip_load_resource :message, through: :room, only: :create

  private

  def parent
    @room
  end

  def collection
    @messages ||= parent.messages
  end

  def build_resource
    @message = collection.new(resource_params)
  end

  def resource
    @message
  end

  def resource_params
    params.require(:message).permit(:content).merge(user: current_user)
  end
end
