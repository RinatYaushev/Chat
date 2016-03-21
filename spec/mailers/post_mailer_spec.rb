require 'rails_helper'

RSpec.describe PostMailer, type: :mailer do
  let(:post) { double }

  before do
    #
    # Recipient.new(post).emails -> %w(one@digits.com two@digits.com)
    #
    expect(Recipients).to receive(:new).with(post) do
      double.tap { |a| expect(a).to receive(:emails).and_return(%w(one@digits.com two@digits.com)) }
    end
  end

  subject { PostMailer.email post }

  its(:from) { should eq ['notice@example.com'] }

  its(:to) { should eq %w(one@digits.com two@digits.com) }

  its(:subject) { should eq 'New message' }
end
