class Vote < ActiveRecord::Base
  belongs_to :user

  belongs_to :votable, polymorphic: true

  validates :user_id, uniqueness: { scope: [:votable_id, :votable_type] }

  enum kind: [:like, :dislike]
end