class Api::CommentsController < ApplicationController
  load_and_authorize_resource :product

  load_and_authorize_resource :comment, through: :product

  skip_load_resource :comment, through: :product, only: :create

  private

  def parent
    @product
  end

  def collection
    @comments ||= parent.comments
  end

  def build_resource
    @comment = collection.new(resource_params)
  end

  def resource
    @comment
  end

  def resource_params
    params.require(:comment).permit(:content).merge(user: current_user)
  end
end
