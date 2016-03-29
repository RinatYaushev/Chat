class Api::PurchasesController < ApplicationController
  load_and_authorize_resource

  private

  def collection
    @purchases ||= current_user.purchases
  end

  def build_resource
    @purchase
  end

  def resource
    @purchase
  end

  def resource_params
    params.require(:purchase).permit(:product_id, :quantity).merge(user: current_user)
  end
end
