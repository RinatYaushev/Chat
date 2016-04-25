class Post < ActiveRecord::Base
  belongs_to :room

  belongs_to :user

  validates :room, presence: true

  after_commit :create_jobs, on: :create

  private

  def create_jobs
    ChatJob.perform_later(self)

    FollowerJob.perform_later(self)

    FacebookPublisherJob.perform_later(self)

    TwitterPublisherJob.perform_later(self)
  end
end
