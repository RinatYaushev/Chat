class Comment < ActiveRecord::Base
  belongs_to :user

  belongs_to :product

  belongs_to :comment

  has_many :replies, class_name: 'Comment', foreign_key: 'comment_id'

  validates :user, :product, :content, presence: true
end
