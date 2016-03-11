require 'rails_helper'

describe RoomDecorator do
  describe '#as_json' do
    let(:room) { stub_model Room, id: 1, name: 'test_room' }

    subject { room.decorate.as_json }

    its([:id]) { should eq 1 }

    its([:name]) { should eq 'test_room' }
  end
end
