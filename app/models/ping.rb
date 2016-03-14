class Ping < Post
  belongs_to :user, counter_cache: true

  validates :user, :room, presence: true

  validates :content, absence: true
end
