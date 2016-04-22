class ChatJob < ActiveJob::Base
  queue_as :default

  def perform post
    Recipients.new(post).users.each do |user|
      ChatMailer.email(user).deliver_now
    end
  end
end
