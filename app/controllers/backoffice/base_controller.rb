class Backoffice::BaseController < ApplicationController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :resource, :collection, :current_user

  before_action :authenticate

  private

  def authenticate
    redirect_to [:new, :backoffice, :session] unless current_user
  end

  def current_user
    @current_user ||= Backoffice::User.find_by id: session[:backoffice_user_id]
  end
end
