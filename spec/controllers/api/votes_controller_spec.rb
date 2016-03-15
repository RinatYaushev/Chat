require 'rails_helper'

RSpec.describe Api::VotesController, type: :controller do
  it { should route(:post, '/api/rooms/1/messages/1/vote').to(action: :create, room_id: 1, message_id: 1) }

  it { should route(:post, '/api/rooms/1/pings/1/vote').to(action: :create, room_id: 1, ping_id: 1) }

  before { sign_in }

  describe '#parent' do
    context do
      before { expect(subject).to receive(:params).and_return(message_id: 1).twice }

      before { expect(Message).to receive(:find).with(1) }

      it { expect { subject.send :parent }.to_not raise_error }
    end

    context do
      before { expect(subject).to receive(:params).and_return(ping_id: 2).at_least(3) }

      before { expect(Ping).to receive(:find).with(2) }

      it { expect { subject.send :parent }.to_not raise_error }
    end

    context do
      it { expect { subject.send :parent }.to raise_error(ActiveRecord::RecordNotFound) }
    end
  end

  describe '#collection' do
    before do
      #
      # subject.parent.votes -> :votes
      #
      expect(subject).to receive(:parent) do
        double.tap { |a| expect(a).to receive(:votes).and_return(:votes) }
      end
    end

    its(:collection) { should eq :votes }
  end
end
