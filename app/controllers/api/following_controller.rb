class Api::FollowingController < ApplicationController
  private

  def resource
    @following ||= current_user.following
  end
end
