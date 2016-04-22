class TwitterPublisherJob < ActiveJob::Base
  queue_as :default

  def perform post
    TwitterPublisher.new(post).publish
  end
end
