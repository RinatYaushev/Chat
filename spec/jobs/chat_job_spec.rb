require 'rails_helper'

RSpec.describe ChatJob, type: :job do
  describe '#perform' do
    let(:post) { double }

    let(:one) { double }

    let(:two) { double }

    before do
      #
      # Recipient.new(post).users -> [one, two]
      #
      expect(Recipients).to receive(:new).with(post) do
        double.tap { |a| expect(a).to receive(:users).and_return([one, two]) }
      end
    end

    before do
      #
      # ChatMailer.email(one).deliver_now
      #
      expect(ChatMailer).to receive(:email).with(one) do
        double.tap { |a| expect(a).to receive(:deliver_now) }
      end
    end

    before do
      #
      # ChatMailer.email(two).deliver_now
      #
      expect(ChatMailer).to receive(:email).with(two) do
        double.tap { |a| expect(a).to receive(:deliver_now) }
      end
    end

    it { expect { subject.perform post }.to_not raise_error }
  end
end
