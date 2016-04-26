class Api::RepliesController < ApplicationController
  authorize_resource :reply, class: false

  private

  def parent
    @comment ||= Comment.find(params[:comment_id])
  end

  def collection
    @replies ||= parent.replies
  end

  def build_resource
    @reply = collection.new(resource_params)
  end

  def resource
    @reply ||= Comment.find(params[:id])
  end

  def resource_params
    params.require(:reply).permit(:content).merge(user: current_user)
  end
end
