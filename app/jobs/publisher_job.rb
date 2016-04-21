class PublisherJob < ActiveJob::Base
  queue_as :default

  def perform post
    FacebookPublisher.new(post).publish

    TwitterPublisher.new(post).publish
  end
end
