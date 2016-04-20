require 'rails_helper'

RSpec.describe FollowerMailer, type: :mailer do
  let(:post) { double }

  before do
    #
    # post.user.followers.pluck(:email) -> %w(one@example.com two@example.com)
    #
    expect(post).to receive(:user) do
      double.tap do |a|
        expect(a).to receive(:followers) do
          double.tap { |b| expect(b).to receive(:pluck).with(:email).and_return(%w(one@example.com two@example.com)) }
        end
      end
    end
  end

  subject { FollowerMailer.email post }

  its(:from) { should eq ['notice@example.com'] }

  its(:to) { should eq %w(one@example.com two@example.com) }

  its(:subject) { should eq 'New message' }
end
