class Vote < ActiveRecord::Base
  belongs_to :user

  belongs_to :votable, polymorphic: true

  validates :user_id, uniqueness: { scope: [:votable_id, :votable_type] }

  validates :user, :kind, presence: true

  enum kind: [:like, :dislike]
end
