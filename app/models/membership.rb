class Membership < ActiveRecord::Base
  belongs_to :user

  belongs_to :room

  validates :user, :room, presence: true
end
