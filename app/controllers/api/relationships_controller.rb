class Api::RelationshipsController < ApplicationController
  private

  def build_resource
    @relationship = Relationship.new(resource_params)
  end

  def resource
    @relationship ||= Relationship.find(params[:id])
  end

  def resource_params
    params.require(:relationship).permit(:followee_id).merge(follower_id: current_user.id)
  end
end
