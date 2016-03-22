require 'rails_helper'

RSpec.describe Post, type: :model do
  it { should belong_to(:room) }

  it { should validate_presence_of :room }

  describe '#create_job' do
    subject { stub_model Post }

    before do
      #
      # PostMailer.email(subject).deliver_later
      #
      expect(PostMailer).to receive(:email).with(subject) do
        double.tap { |a| expect(a).to receive(:deliver_later) }
      end
    end

    # it do
    #   expect { subject.save }.to_not raise_error
    # end
  end
end
