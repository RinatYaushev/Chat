class FacebookPublisherJob < ActiveJob::Base
  queue_as :default

  def perform post
    FacebookPublisher.new(post).publish
  end
end
