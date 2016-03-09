class Api::ProfilesController < ApplicationController
  private

  def resource
    @profile ||= User.find(params[:user_id])
  end
end
