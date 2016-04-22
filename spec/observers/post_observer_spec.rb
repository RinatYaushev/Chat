require 'rails_helper'

RSpec.describe PostObserver, type: :observer do
  describe '#after_create' do
    let(:post) { stub_model(Post, valid?: true).as_new_record }

    before { expect(ChatJob).to receive(:perform_later).with(post) }

    before { expect(FollowerJob).to receive(:perform_later).with(post) }

    before { expect(FacebookPublisherJob).to receive(:perform_later).with(post) }

    before { expect(TwitterPublisherJob).to receive(:perform_later).with(post) }

    it do
      ActiveRecord::Base.observers.enable :post_observer do
        expect { post.save }.to_not raise_error
      end
    end
  end
end
