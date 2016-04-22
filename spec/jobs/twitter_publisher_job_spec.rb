require 'rails_helper'

RSpec.describe TwitterPublisherJob, type: :job do
  describe '#perform' do
    let(:post) { double }

    before do
      #
      # TwitterPublisher.new(post).publish
      #
      expect(TwitterPublisher).to receive(:new).with(post) do
        double.tap { |a| expect(a).to receive(:publish) }
      end
    end

    it { expect { subject.perform post }.to_not raise_error }
  end
end
