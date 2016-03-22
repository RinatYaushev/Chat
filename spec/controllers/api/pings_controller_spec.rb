require 'rails_helper'

RSpec.describe Api::PingsController, type: :controller do
  it { should route(:get, '/api/rooms/1/pings').to(action: :index, room_id: 1) }

  it { should route(:post, '/api/rooms/1/pings').to(action: :create, room_id: 1) }

  before { sign_in }

  describe '#create.json' do
    let(:room) { stub_model Room }

    let(:ping) { double }

    before { expect(Room).to receive(:find).with('10').and_return(room) }

    before { expect(subject.current_ability).to receive(:can?).with(:show, room).and_return(true) }

    before { expect(subject.current_ability).to receive(:can?).with(:create, room => Ping).and_return(true) }

    before do
      #
      #subject.collection.new -> ping
      #
      expect(subject).to receive(:collection) do
        double.tap { |a| expect(a).to receive(:new).with(user: subject.current_user).and_return(ping) }
      end
    end

    before { expect(ping).to receive(:save!) }

    before { post :create, room_id: 10, format: :json }

    it { should render_template :create }
  end

  describe '#index.json' do
    let(:room) { stub_model Room }

    let(:ping) { double }

    before { expect(Room).to receive(:find).with('24').and_return(room) }

    before { expect(subject.current_ability).to receive(:can?).with(:show, room).and_return(true) }

    before { expect(subject.current_ability).to receive(:can?).with(:index, room => Ping).and_return(true) }

    before { get :index, room_id: 24, format: :json }

    it { should render_template :index }
  end

  describe '#parent' do
    before { subject.instance_variable_set :@room, :room }

    its(:parent) { should eq :room }
  end

  describe '#collection' do
    before do
      #
      # subject.parent.pings -> pings
      #
      expect(subject).to receive(:parent) do
        double.tap { |a| expect(a).to receive(:pings).and_return(:pings) }
      end
    end

    its(:collection) { should eq :pings }
  end

  describe '#resource' do
    before { subject.instance_variable_set :@ping, :ping }

    its(:resource) { should eq :ping }
  end
end
