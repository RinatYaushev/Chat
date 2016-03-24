class Purchase < ActiveRecord::Base
  belongs_to :user, counter_cache: true

  belongs_to :product

  belongs_to :order

  validates :user, :product, :quantity, presence: true

  validates :product_id, uniqueness: { scope: [:user_id, :order_id] }

  scope :cart, -> { where(order_id: nil) }
end
