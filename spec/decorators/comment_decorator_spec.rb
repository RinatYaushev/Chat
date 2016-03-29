require 'rails_helper'

describe CommentDecorator, type: :decorator do
  describe '#as_json' do
    let(:comment) { stub_model Comment, id: 1, content: 'test_comment', user_id: 48, product_id: 49, comment_id: 50 }

    subject { comment.decorate }

    before { expect(subject).to receive(:replies).and_return(:replies) }

    its('as_json.symbolize_keys') do
      should eq \
        id: 1,
        content: 'test_comment',
        user_id: 48,
        product_id: 49,
        comment_id: 50,
        replies: :replies
    end
  end
end
