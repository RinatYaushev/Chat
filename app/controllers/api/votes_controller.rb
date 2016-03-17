class Api::VotesController < ApplicationController
  private

  def parent
    if params[:message_id]
      @message = Message.find(params[:message_id])
    elsif params[:ping_id]
      @ping = Ping.find(params[:ping_id])
    end
  end

  def collection
    @votes ||= parent.votes
  end

  def build_resource
    @vote = Vote.find_or_initialize_by(votable_id: parent.id, votable_type: parent.type, user: current_user).tap do |a|
      a.kind = params[:kind]
    end
  end

  def resource
    @vote ||= collection.find(params[:id])
  end
end
