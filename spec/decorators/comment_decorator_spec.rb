require 'rails_helper'

describe CommentDecorator, type: :decorator do
  describe '#as_json' do
    let(:comment) { stub_model Comment, id: 1, content: 'test_comment', user_id: 48, product_id: 49, comment_id: 50 }

    subject { comment.decorate.as_json.symbolize_keys }

    its([:id]) { should eq 1 }

    its([:content]) { should eq 'test_comment' }

    its([:user_id]) { should eq 48 }

    its([:product_id]) { should eq 49 }

    its([:comment_id]) { should eq 50 }
  end
end
