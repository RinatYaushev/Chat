class FollowerMailer < ApplicationMailer
  def email post
    @post = post

    mail to: @post.user.followers.pluck(:email), subject: 'New message'
  end
end
