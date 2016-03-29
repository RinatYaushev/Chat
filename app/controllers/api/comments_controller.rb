class Api::CommentsController < ApplicationController
  private

  def parent
    @product ||= Product.find(params[:product_id])
  end

  def collection
    @comments ||= parent.comments
  end

  def build_resource
    @comment = collection.new(resource_params)
  end

  def resource
    @comment ||= Comment.find(params[:id])
  end

  def resource_params
    params.require(:comment).permit(:content).merge(user: current_user)
  end
end
