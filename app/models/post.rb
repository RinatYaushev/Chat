class Post < ActiveRecord::Base
  belongs_to :room

  belongs_to :user

  validates :room, presence: true
end
