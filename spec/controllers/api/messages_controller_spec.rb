require 'rails_helper'

RSpec.describe Api::MessagesController, type: :controller do
  it { should route(:get, '/api/rooms/1/messages').to(action: :index, room_id: 1) }

  it { should route(:post, '/api/rooms/1/messages').to(action: :create, room_id: 1) }

  before { sign_in }

  describe '#create.json' do
    let(:room) { stub_model Room }

    let(:message) { double }

    let(:params) { { content: 'test_content', user: subject.current_user } }

    before { expect(Room).to receive(:find).with('56').and_return(room) }

    before { expect(subject.current_ability).to receive(:can?).with(:show, room).and_return(true) }

    before { expect(subject.current_ability).to receive(:can?).with(:create, Message).and_return(true) }

    before do
      #
      #subject.collection.new -> message
      #
      expect(subject).to receive(:collection) do
        double.tap do |a|
          expect(a).to receive(:new).with(params).and_return(message)
        end
      end
    end

    before { expect(message).to receive(:save!) }

    before { post :create, room_id: 56, message: params, format: :json }

    it { should render_template :create }
  end

  describe '#collection' do
    before do
      #
      # subject.parent.messages -> messages
      #
      expect(subject).to receive(:parent) do
        double.tap { |a| expect(a).to receive(:messages).and_return(:messages) }
      end
    end

    its(:collection) { should eq :messages }
  end
end
