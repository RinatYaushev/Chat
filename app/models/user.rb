class User < ActiveRecord::Base
  has_secure_password

  has_one :auth_token, dependent: :destroy

  has_many :rooms, through: :memberships

  has_many :memberships, dependent: :destroy

  has_many :messages, dependent: :destroy

  has_many :pings, dependent: :destroy

  has_many :purchases, dependent: :destroy

  has_many :orders, dependent: :destroy

  enum gender: [:man, :woman]

  has_attached_file :avatar,
    default_url: '/images/:style/missing.png',
    convert_options: { all: '-strip' }

  validates_attachment :avatar,
    content_type: { content_type: /\Aimage\/png\Z|\Aimage\/jpe?g\Z/ },
    file_name: { matches: [/png\Z/, /jpe?g\Z/] }

  validates :email, email: true, presence: true, uniqueness: { case_sensitive: false }

  validates :name, :gender, presence: true

  validates :phone, phone: true
end
