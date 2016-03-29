require 'rails_helper'

describe ReplyDecorator, type: :decorator do
  describe '#as_json' do
    let(:comment) { stub_model Comment, id: 1, content: 'test_comment', user_id: 20, comment_id: 21 }

    subject { comment.decorate.as_json.symbolize_keys }

    its([:id]) { should eq 1 }

    its([:content]) { should eq 'test_comment' }

    its([:user_id]) { should eq 20 }

    its([:comment_id]) { should eq 21 }
  end
end
