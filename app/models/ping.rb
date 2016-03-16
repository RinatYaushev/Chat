class Ping < Post
  has_many :votes, as: :votable, dependent: :destroy

  belongs_to :user, counter_cache: true

  validates :user, presence: true
end
