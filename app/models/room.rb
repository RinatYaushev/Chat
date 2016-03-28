class Room < ActiveRecord::Base
  has_many :users, through: :memberships

  has_many :memberships, dependent: :destroy

  has_many :messages, dependent: :destroy

  has_many :pings, dependent: :destroy

  has_many :pictures, dependent: :destroy

  has_many :men, -> { male }, class_name: 'User', through: :memberships, source: :user

  has_many :women, -> { female }, class_name: 'User', through: :memberships, source: :user

  validates :name, presence: true

  validates :memberships, length: { minimum: 2, message: 'Cannot be 1 user' }

  class << self
    def build user, params = {}
      params[:user_ids] = params[:user_ids]&.push(user.id)

      new params
    end
  end
end
