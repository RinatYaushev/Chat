class Api::OrdersController < ApplicationController
  load_and_authorize_resource

  private

  def collection
    @orders ||= current_user.orders
  end

  def build_resource
    @order = collection.build(purchases: current_user.purchases.cart)
  end

  def resource
    @order
  end
end
