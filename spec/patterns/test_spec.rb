require 'rails_helper'

RSpec.describe Test::User do
  it { should be_a Observable }

  let(:user) { Test::User.new 'Bob', 'test@test.com' }

  let(:posts) { [] }

  let(:subscribers) { [] }

  subject { user }

  describe '.new' do
    its(:name) { should eq 'Bob' }

    its(:email) { should eq 'test@test.com' }

    its(:posts) { should eq [] }

    its(:subscribers) { should eq [] }
  end

  describe '#add_subscriber' do
    let(:subscriber) { double }

    before { subject.add_subscriber subscriber }

    its(:subscribers) { should eq [subscriber] }
  end

  describe '#add_post' do
    let(:post) { double }

    before { expect(subject).to receive(:changed) }

    before { expect(subject).to receive(:notify_observers).with(subject, post) }

    before { subject.add_post post }

    its(:posts) { should eq [post] }
  end
end

RSpec.describe Test::Post do
  let(:post) { Test::Post.new 'test post' }

  subject { post }

  describe '.new' do
    its(:content) { should eq 'test post' }
  end
end

RSpec.describe Test::Publisher do
  let(:user) { Test::User.new('Bob', 'test@test.com') }

  let(:post) { Test::Post.new('test post') }

  let(:publisher) { Test::Publisher.new(user, post) }

  subject { publisher }

  describe '.new' do
    its(:user) { should eq user }

    its(:post) { should eq post }
  end

  describe '#publish' do
    before { expect(subject).to receive(:puts).with("Publisher: Bob wrote - 'test post'") }

    it { expect { subject.publish }.to_not raise_error }
  end
end

# RSpec.describe Test::Notifier do
#   describe '#update' do
#     let(:post) { Test::Post.new('test post') }

#     let(:other_user) { Test::User.new('John', '123456@test.com') }

#     let(:user) { Test::User.new('Bob', 'test@test.com', [other_user], [post]) }

#     let(:mail_builder) { MailFactory.new }

#     before { expect(MailFactory).to receive(:new).and_return(mail_builder) }

#     before do
#       #
#       # user.subscribers.map(&:email).join(", ") -> '123456@test.com'
#       #
#       expect(user).to receive(:subscribers) do
#         double.tap do |a|
#           expect(a).to receive(:map) do
#             double.tap { |b| expect(b).to receive(:join).with(", ").and_return('123456@test.com') }
#           end
#         end
#       end
#     end

#     before { expect(user).to receive(:email).and_return('test@test.com') }

#     before do
#       #
#       # Test::FacebookPublisher.new(user, post).publish -> Facebook: Bob wrote - 'test post'
#       #
#       expect(Test::FacebookPublisher).to receive(:new).with(user, post) do
#         double.tap { |a| expect(a).to receive(:publish).and_return("Facebook: Bob wrote - 'test post'") }
#       end
#     end

#     before do
#       #
#       # Test::TwitterPublisher.new(user, post).publish -> Twitter: Bob wrote - 'test post'
#       #
#       expect(Test::TwitterPublisher).to receive(:new).with(user, post) do
#         double.tap { |a| expect(a).to receive(:publish).and_return("Twitter: Bob wrote - 'test post'") }
#       end
#     end

#     it { expect { subject.update(user, post) }.to_not raise_error }
#   end
# end
