class FollowerJob < ActiveJob::Base
  queue_as :default

  def perform post
    post.user.followers.each do |follower|
      FollowerMailer.email(follower).deliver_now
    end
  end
end
