require 'rails_helper'

RSpec.describe Api::VotesController, type: :controller do
  it { should route(:post, '/api/messages/1/vote').to(action: :create, message_id: 1) }

  it { should route(:post, '/api/pings/1/vote').to(action: :create, ping_id: 1) }

  before { sign_in }

  describe '#create.json' do
    context do
      let(:message) { stub_model Message, id: 1, type: 'Message' }

      let(:vote) { double }

      before { expect(Message).to receive(:find).with('7').and_return(message).twice }

      before { expect(Vote).to receive(:find_or_initialize_by).
        with(votable_id: message.id, votable_type: message.type, user: subject.current_user).and_return(vote) }

      before { expect(vote).to receive(:kind=).with('like').and_return true }

      before { expect(vote).to receive(:save!) }

      before { post :create, message_id: 7, kind: 'like', format: :json }

      it { should render_template :create }
    end

    context do
      let(:ping) { stub_model Ping, id: 1, type: 'Ping' }

      let(:vote) { double }

      before { expect(Ping).to receive(:find).with('25').and_return(ping).twice }

      before { expect(Vote).to receive(:find_or_initialize_by).
        with(votable_id: ping.id, votable_type: ping.type, user: subject.current_user).and_return(vote) }

      before { expect(vote).to receive(:kind=).with('dislike').and_return true }

      before { expect(vote).to receive(:save!) }

      before { post :create, ping_id: 25, kind: 'dislike', format: :json }

      it { should render_template :create }
    end
  end

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
  end

  describe '#collection' do
    before do
      #
      # subject.parent.votes -> votes
      #
      expect(subject).to receive(:parent) do
        double.tap { |a| expect(a).to receive(:votes).and_return(:votes) }
      end
    end

    its(:collection) { should eq :votes }
  end

  describe '#resource' do
    before { expect(subject).to receive(:params).and_return(id: 1) } # это застабить метод парамс и вернуть хэш

    before do
      #
      # subject.collection.find(1)
      #
      expect(subject).to receive(:collection) do
        double.tap { |a| expect(a).to receive(:find).with(1) }
      end
    end

    it { expect { subject.send :resource }.to_not(raise_error) }
  end
end
