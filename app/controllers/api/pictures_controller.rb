class Api::PicturesController < ApplicationController
  load_and_authorize_resource :room

  load_and_authorize_resource :picture, through: :room

  skip_load_resource :picture, through: :room, only: :create

  private

  def parent
    @room
  end

  def collection
    @pictures ||= parent.pictures
  end

  def build_resource
    @picture = collection.new(resource_params)
  end

  def resource
    @picture
  end

  def resource_params
    params.require(:picture).permit(:image).merge(user: current_user)
  end
end
