class Api::OrdersController < ApplicationController
  load_and_authorize_resource

  skip_load_resource only: :create

  private

  def collection
    @orders ||= current_user.orders
  end

  def build_resource
    @order = collection.build(purchase_ids: current_user.purchases.cart.pluck(:id))
  end

  def resource
    @order
  end
end
