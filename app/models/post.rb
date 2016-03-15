class Post < ActiveRecord::Base
  has_many :votes, as: :votable, dependent: :destroy

  belongs_to :room

  validates :room, presence: true
end
