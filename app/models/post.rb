class Post < ActiveRecord::Base
  belongs_to :room

  validates :room, presence: true

  after_commit :create_job, on: :create

  private

  def create_job
    PostMailer.email(self).deliver_later
  end
end
