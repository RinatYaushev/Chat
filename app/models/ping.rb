class Ping < Post
  belongs_to :user, counter_cache: true

  validates :user, presence: true
end
