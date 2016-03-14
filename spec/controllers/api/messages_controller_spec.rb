require 'rails_helper'

RSpec.describe Api::MessagesController, type: :controller do
  it { should route(:get, '/api/rooms/1/messages').to(action: :index, room_id: 1) }

  it { should route(:post, '/api/rooms/1/messages').to(action: :create, room_id: 1) }

  before { sign_in }

  describe '#collection' do
    before do
      #
      # subject.parent.messages -> :messages
      #
      expect(subject).to receive(:parent) do
        double.tap { |a| expect(a).to receive(:messages).and_return(:messages) }
      end
    end

    its(:collection) { should eq :messages }
  end
end
