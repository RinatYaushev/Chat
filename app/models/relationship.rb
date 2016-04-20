class Relationship < ActiveRecord::Base
  belongs_to :follower, class_name: 'User'

  belongs_to :followee, class_name: 'User'

  validates :follower_id, :followee_id, presence: true

  validates :follower_id, uniqueness: { scope: :followee_id }

  validate :follower_id_not_eq_followee_id

  def follower_id_not_eq_followee_id
    errors.add(:cannot_follow_self, 'cannot follow yourself') if follower_id == followee_id
  end
end
