class Purchase < ActiveRecord::Base
  belongs_to :user, counter_cache: true

  belongs_to :product

  belongs_to :order

  validates :user, :product, :quantity, presence: true

  validates :product_id, uniqueness: { scope: [:user_id, :order_id] }

  validates :quantity, numericality: { greater_than: 0 }

  scope :cart, -> { where(order_id: nil) }

  before_save :calculate_sum

  def calculate_sum
    self.sum = (quantity * product.price).to_f
  end
end
