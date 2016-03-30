class Backoffice::UsersController < Backoffice::BaseController
  def update
    if resource.update(resource_params)
      redirect_to resource
    else
      render :edit
    end
  end

  def destroy
    resource.touch :deleted_at

    redirect_to :backoffice
  end

  private

  def collection
    @users = Backoffice::User.all.active
  end

  def resource
    @user ||= Backoffice::User.find(params[:id])
  end

  def resource_params
    params.require(:backoffice_user).permit(:name, :password, :password_confirmation)
  end
end
