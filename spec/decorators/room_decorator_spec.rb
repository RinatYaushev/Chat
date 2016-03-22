require 'rails_helper'

describe RoomDecorator, type: :decorator do
  describe '#as_json' do
    let(:room) { stub_model Room, id: 12, name: 'test_room' }

    subject { room.decorate }

    before { expect(subject).to receive(:users).and_return(:users) }

    its('as_json.symbolize_keys') do
      should eq \
        id: 12,
        name: 'test_room',
        users: :users
    end
  end
end
