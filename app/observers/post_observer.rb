class PostObserver < ActiveRecord::Observer
  def after_create post
    PostMailer.email(post).deliver_now
  end
end
