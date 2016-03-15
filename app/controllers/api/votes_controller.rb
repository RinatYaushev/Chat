class Api::VotesController < ApplicationController
  private

  def parent
    if params[:message_id]
      @message = Message.find(params[:message_id])
    elsif params[:ping_id]
      @ping = Ping.find(params[:ping_id])
    else
      raise ActiveRecord::RecordNotFound
    end
  end

  def collection
    @votes ||= parent.votes
  end

  def build_resource
    @vote = collection.build(resource_params)
  end

  def resource
    @vote ||= collection.find(params[:id])
  end

  def resource_params
    params.require(:vote).permit(:kind).merge(user: current_user)
  end
end
