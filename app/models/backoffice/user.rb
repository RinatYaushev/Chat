class Backoffice::User < ActiveRecord::Base
  has_secure_password

  validates :name, presence: true, uniqueness: { case_sensitive: false }

  scope :active, -> { where(deleted_at: nil) }
end
