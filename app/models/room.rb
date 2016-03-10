class Room < ActiveRecord::Base
  has_many :users, through: :memberships, dependent: :destroy

  has_many :memberships, dependent: :destroy

  has_many :messages, dependent: :destroy

  validates :name, presence: true

  validate :min_users

  def min_users
    errors.add(:room, 'Cannot be 1 user') if memberships.size < 2
  end
end
