class Backoffice::UsersController < Backoffice::BaseController

  def update
    if resource.update(resource_params)
      redirect_to resource
    else
      render :edit
    end
  end

  private

  def collection
    @users = Backoffice::User.all
  end

  def resource
    @user ||= Backoffice::User.find(params[:id])
  end

  def resource_params
    params.require(:backoffice_user).permit(:name, :password, :password_confirmation)
  end
end
