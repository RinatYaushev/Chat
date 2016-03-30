class Backoffice::SessionsController < Backoffice::BaseController
  skip_before_action :authenticate, only: [:new, :create]

  def create
    @session = Backoffice::Session.new resource_params

    if user = resource.save
      session[:backoffice_user_id] = user.id

      redirect_to :backoffice
    else
      render :new
    end
  end

  def destroy
    session[:backoffice_user_id] = nil

    redirect_to [:new, :backoffice, :session]
  end

  private

  def resource
    @session ||= Backoffice::Session.new
  end

  def resource_params
    params.require(:backoffice_session).permit(:username, :password)
  end
end
