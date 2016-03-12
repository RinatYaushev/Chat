class User < ActiveRecord::Base
  has_secure_password

  has_one :auth_token, dependent: :destroy

  has_many :rooms, through: :memberships

  has_many :memberships, dependent: :destroy

  has_many :messages, dependent: :destroy

  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
