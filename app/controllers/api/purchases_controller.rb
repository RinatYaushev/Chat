class Api::PurchasesController < ApplicationController
  private

  def collection
    @purchases ||= current_user.purchases
  end

  def build_resource
    @purchase = Purchase.new(resource_params)
  end

  def resource
    @purchase ||= Purchase.find(params[:id])
  end

  def resource_params
    params.require(:purchase).permit(:product_id, :order_id, :quantity).merge(user: current_user)
  end
end
