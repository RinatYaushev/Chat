class Api::FolloweesController < ApplicationController
  private

  def resource
    @followees ||= current_user.followees
  end
end
