require 'rails_helper'

RSpec.describe FollowerMailer, type: :mailer do
  describe '#email' do
    let(:follower) { double }

    before { expect(follower).to receive(:email).and_return('one@example.com') }

    subject { FollowerMailer.email follower }

    its(:from) { should eq ['notice@example.com'] }

    its(:to) { should eq ['one@example.com'] }

    its(:subject) { should eq 'New message' }
  end
end
