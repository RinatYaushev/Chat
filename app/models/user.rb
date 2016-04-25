class User < ActiveRecord::Base
  has_secure_password

  enum gender: [:man, :woman]

  bitmask :roles, as: [:administrator, :moderator, :user]

  has_attached_file :avatar,
    default_url: '/images/:style/missing.png',
    convert_options: { all: '-strip' }

  has_one :auth_token, dependent: :destroy

  has_many :rooms, through: :memberships

  has_many :memberships, dependent: :destroy

  has_many :messages, dependent: :destroy

  has_many :pings, dependent: :destroy

  has_many :purchases, dependent: :destroy

  has_many :orders, dependent: :destroy

  has_many :comments, dependent: :destroy

  has_many :active_relationships, class_name: 'Relationship',
    foreign_key: 'follower_id', dependent: :destroy

  has_many :passive_relationships, class_name: 'Relationship',
    foreign_key: 'followee_id', dependent: :destroy

  has_many :followees, through: :active_relationships, source: :followee

  has_many :followers, through: :passive_relationships, source: :follower

  validates_attachment :avatar,
    content_type: { content_type: /\Aimage\/png\Z|\Aimage\/jpe?g\Z/ },
    file_name: { matches: [/png\Z/, /jpe?g\Z/] }

  validates :email, email: true, presence: true, uniqueness: { case_sensitive: false }

  validates :name, :gender, presence: true

  validates :phone, phone: true

  before_create :set_role

  private

  def set_role
    roles << :user
  end
end
