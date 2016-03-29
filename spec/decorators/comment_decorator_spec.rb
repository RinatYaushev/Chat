require 'rails_helper'

describe CommentDecorator, type: :decorator do
  describe '#as_json' do
    subject { comment.decorate }

    before { expect(subject).to receive(:replies).and_return(:replies) }

    context do
      let(:comment) { stub_model Comment, id: 1, content: 'test_comment', user_id: 48, product_id: 49 }

      its('as_json.symbolize_keys') do
        should eq \
          id: 1,
          content: 'test_comment',
          user_id: 48,
          product_id: 49,
          replies: :replies
      end
    end

    context do
      let(:comment) { stub_model Comment, id: 2, content: 'test_comment', user_id: 17, parent_id: 18 }

      its('as_json.symbolize_keys') do
        should eq \
          id: 2,
          content: 'test_comment',
          user_id: 17,
          parent_id: 18,
          replies: :replies
      end
    end
  end
end
