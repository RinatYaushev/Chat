require 'rails_helper'

RSpec.describe PostObserver, type: :observer do
  describe '#after_create' do
    let(:user) { stub_model User }

    let(:post) { stub_model(Post, valid?: true, user: user).as_new_record }

    before do
      #
      # FollowerMailer.email(post).deliver_later
      #
      expect(FollowerMailer).to receive(:email).with(post) do
        double.tap { |a| expect(a).to receive(:deliver_later) }
      end
    end

    before do
      #
      # PostMailer.email(post).deliver_later
      #
      expect(PostMailer).to receive(:email).with(post) do
        double.tap { |a| expect(a).to receive(:deliver_later) }
      end
    end

    before { expect(PublisherJob).to receive(:perform_later).with(post) }

    it do
      ActiveRecord::Base.observers.enable :post_observer do
        expect { post.save }.to_not raise_error
      end
    end
  end
end
