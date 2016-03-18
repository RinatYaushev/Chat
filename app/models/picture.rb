class Picture < Post
  belongs_to :user, counter_cache: true

  has_many :votes, as: :votable, dependent: :destroy

  has_attached_file :image, convert_options: { all: '-strip' }

  validates :image,
    attachment_content_type: { content_type: /\Aimage\/png\Z|\Aimage\/jpe?g\Z/ },
    attachment_file_name: { matches: [/png\Z/, /jpe?g\Z/] },
    attachment_presence: true

  validates :user, presence: true
end
