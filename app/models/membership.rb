class Membership < ActiveRecord::Base
  belongs_to :user

  belongs_to :room

  validates :user, :room, presence: true

  validates :user_id, uniqueness: { scope: :room_id }
end
