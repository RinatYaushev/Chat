require 'rails_helper'

RSpec.describe Post, type: :model do
  it { should belong_to(:room) }

  it { should validate_presence_of :room }

  it { is_expected.to callback(:create_job).after(:commit) }

  describe '#create_job' do
    before do
      #
      # PostMailer.email(subject).deliver_later
      #
      expect(PostMailer).to receive(:email).with(subject) do
        double.tap { |a| expect(a).to receive(:deliver_later) }
      end
    end

    it { expect { subject.send :create_job }.to_not raise_error }
  end
end
