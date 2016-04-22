class PostObserver < ActiveRecord::Observer
  def after_create post
    ChatJob.perform_later(post)

    FollowerJob.perform_later(post)

    FacebookPublisherJob.perform_later(post)

    TwitterPublisherJob.perform_later(post)
  end
end
