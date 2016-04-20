class PostObserver < ActiveRecord::Observer
  def after_create post
    FollowerMailer.email(post).deliver_later

    PostMailer.email(post).deliver_later

    FacebookPublisher.new(post.user, post).publish

    TwitterPublisher.new(post.user, post).publish
  end
end
