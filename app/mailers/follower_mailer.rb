class FollowerMailer < ApplicationMailer
  def email follower
    @follower = follower

    mail to: follower.email, subject: 'New message'
  end
end
