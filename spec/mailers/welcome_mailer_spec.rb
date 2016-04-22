require 'rails_helper'

RSpec.describe WelcomeMailer, type: :mailer do
  describe '#email' do
    let(:user) { double }

    before { expect(user).to receive(:email).and_return(['test@example.com']) }

    subject { WelcomeMailer.email user }

    its(:from) { should eq ['notice@example.com'] }

    its(:to) { should eq ['test@example.com'] }

    its(:subject) { should eq 'Welcome' }
  end
end
