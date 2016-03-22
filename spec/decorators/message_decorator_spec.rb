require 'rails_helper'

describe MessageDecorator, type: :decorator do
  describe '#as_json' do
    let(:message) { stub_model Message, id: 1, content: 'test_msg', user_id: 18, room_id: 19 }

    subject { message.decorate.as_json.symbolize_keys }

    its([:id]) { should eq 1 }

    its([:content]) { should eq 'test_msg' }

    its([:user_id]) { should eq 18 }

    its([:room_id]) { should eq 19 }
  end
end
