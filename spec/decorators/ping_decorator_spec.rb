require 'rails_helper'

describe PingDecorator do
  describe '#as_json' do
    let(:ping) { stub_model Ping, id: 1, user_id: 18, room_id: 19 }

    subject { ping.decorate.as_json.symbolize_keys }

    its([:id]) { should eq 1 }

    its([:user_id]) { should eq 18 }

    its([:room_id]) { should eq 19 }
  end
end
