require 'rails_helper'

RSpec.describe FollowerJob, type: :job do
  describe '#perform' do
    let(:post) { double }

    let(:one) { double }

    let(:two) { double }

    before do
      #
      # post.user.followers -> [one, two]
      #
      expect(post).to receive(:user) do
        double.tap { |a| expect(a).to receive(:followers).and_return([one, two]) }
      end
    end

    before do
      #
      # FollowerMailer.email(one).deliver_now
      #
      expect(FollowerMailer).to receive(:email).with(one) do
        double.tap { |a| expect(a).to receive(:deliver_now) }
      end
    end

    before do
      #
      # FollowerMailer.email(two).deliver_now
      #
      expect(FollowerMailer).to receive(:email).with(two) do
        double.tap { |a| expect(a).to receive(:deliver_now) }
      end
    end

    it { expect { subject.perform post }.to_not raise_error }
  end
end
