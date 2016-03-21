require 'rails_helper'

RSpec.describe PostObserver do
  describe '#after_create' do
    let(:post) { stub_model(Post, valid?: true).as_new_record }

    before do
      #
      # PostMailer.email(post).deliver_now
      #
      expect(PostMailer).to receive(:email).with(post) do
        double.tap { |a| expect(a).to receive(:deliver_now) }
      end
    end

    it do
      ActiveRecord::Base.observers.enable :post_observer do
        expect { post.save }.to_not raise_error
      end
    end
  end
end
