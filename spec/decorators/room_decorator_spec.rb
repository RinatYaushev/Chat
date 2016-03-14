require 'rails_helper'

describe RoomDecorator do
  describe '#as_json' do
    let(:room) { stub_model Room, id: 1, name: 'test_room' }

    subject { room.decorate.as_json }

    its([:id]) { should eq 1 }

    its([:name]) { should eq 'test_room' }

    context do
      let(:decorated) { room.decorate }

      before { expect(decorated).to receive(:users).and_return(:users) }

      subject { decorated.as_json }

      its([:users]) { should eq :users }
    end

    context do
      subject { room.decorate.as_json brief: true }

      its([:users]) { should be_nil }
    end
  end
end
