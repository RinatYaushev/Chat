class Comment < ActiveRecord::Base
  belongs_to :user

  belongs_to :product

  belongs_to :parent, class_name: 'Comment'

  has_many :replies, class_name: 'Comment', foreign_key: :parent_id

  validates :user, :content, presence: true

  validates :product, presence: true, unless: :parent_id?
end
