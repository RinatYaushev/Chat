require 'rails_helper'

RSpec.describe Builder::UserBuilder do
  subject { Builder::UserBuilder.new 'Bob', 'Bobenko' }

  describe '.new' do
    let(:user) { Builder::User.new }

    before { expect(Builder::User).to receive(:new).and_return(user) }

    its(:user) { should eq user }
  end

  describe '#add_posts' do
    let(:post) { Builder::Post.new }

    before { expect(Builder::Post).to receive(:new).and_return(post) }

    before { subject.add_posts 1 }

    its('user.posts') { should eq [post] }
  end

  describe '#add_comments' do
    let(:comment) { Builder::Comment.new }

    before { expect(Builder::Comment).to receive(:new).and_return(comment) }

    before { subject.add_comments 1 }

    its('user.comments') { should eq [comment] }
  end
end
