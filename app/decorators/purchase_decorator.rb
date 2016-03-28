class PurchaseDecorator < Draper::Decorator
  delegate_all

  def as_json *args
    super only: [:id, :user_id, :product_id, :order_id, :quantity, :sum]
  end
end
