require 'rails_helper'

RSpec.describe ChatMailer, type: :mailer do
  describe '#email' do
    let(:user) { double }

    before { expect(user).to receive(:email).and_return('one@digits.com') }

    subject { ChatMailer.email user }

    its(:from) { should eq ['notice@example.com'] }

    its(:to) { should eq ['one@digits.com'] }

    its(:subject) { should eq 'New message' }
  end
end
