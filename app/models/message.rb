class Message < Post
  belongs_to :user, counter_cache: true

  validates :content, :user, :room, presence: true
end
