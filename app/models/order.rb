class Order < ActiveRecord::Base
  belongs_to :user, counter_cache: true

  has_many :purchases

  validates :user, presence: true

  validates :total, numericality: { greater_than: 0 }

  before_validation :calculate_total, on: :create

  private

  def calculate_total
    self.total = purchases.inject(0) { |sum, purchase| sum + purchase.sum }
  end
end
