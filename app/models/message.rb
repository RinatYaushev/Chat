class Message < ActiveRecord::Base
  belongs_to :user, counter_cache: true

  belongs_to :room

  validates :content, :user, :room, presence: true
end
