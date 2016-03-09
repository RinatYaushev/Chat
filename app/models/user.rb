class User < ActiveRecord::Base
  has_secure_password

  has_one :auth_token, dependent: :destroy

  has_many :rooms, through: :memberships, dependent: :destroy
  has_many :memberships, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
