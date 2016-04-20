class Api::FollowersController < ApplicationController
  private

  def resource
    @followers ||= current_user.followers
  end
end
