class Product < ActiveRecord::Base
  has_many :comments, dependent: :destroy

  validates :name, :price, presence: true

  validates :price, numericality: { greater_than: 0 }
end
