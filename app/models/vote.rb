class Vote < ActiveRecord::Base
  belongs_to :user

  belongs_to :votable, polymorphic: true

  validates :user, uniqueness: { scope: [:votable_id, :votable_type] }

  validates :user, presence: true

  enum kind: [:like, :dislike]
end
