class Post < ActiveRecord::Base
  belongs_to :room

  validates :room, presence: true
end
