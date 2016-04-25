require 'rails_helper'

RSpec.describe Post, type: :model do
  it { should belong_to(:room) }

  it { should belong_to(:user) }

  it { should validate_presence_of :room }

  it { is_expected.to callback(:create_jobs).after(:commit).on(:create) }

  describe '#create_jobs' do
    before { expect(ChatJob).to receive(:perform_later).with(subject) }

    before { expect(FollowerJob).to receive(:perform_later).with(subject) }

    before { expect(FacebookPublisherJob).to receive(:perform_later).with(subject) }

    before { expect(TwitterPublisherJob).to receive(:perform_later).with(subject) }

    it { expect { subject.send :create_jobs }.to_not raise_error }
  end
end
