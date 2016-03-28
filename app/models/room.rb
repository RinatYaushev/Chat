class Room < ActiveRecord::Base
  has_many :users, through: :memberships

  has_many :men, -> { man }, class_name: 'User', through: :memberships, source: :user

  has_many :women, -> { woman }, class_name: 'User', through: :memberships, source: :user

  has_many :memberships, dependent: :destroy

  has_many :messages, dependent: :destroy

  has_many :pings, dependent: :destroy

  has_many :pictures, dependent: :destroy

  validates :name, presence: true

  validates :memberships, length: { minimum: 2, message: 'Cannot be 1 user' }

  class << self
    def build user, params = {}
      params[:user_ids] = params[:user_ids]&.push(user.id)

      new params
    end
  end
end
