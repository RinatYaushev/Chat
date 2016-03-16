require 'rails_helper'

RSpec.describe Api::RoomsController, type: :controller do
  it { should route(:get, '/api/rooms').to(action: :index) }

  it { should route(:post, '/api/rooms').to(action: :create) }

  it { should route(:put, '/api/rooms/1').to(action: :update, id: 1) }

  it { should route(:delete, '/api/rooms/1').to(action: :destroy, id: 1) }

  it { should route(:get, '/api/rooms/1').to(action: :show, id: 1) }

  let(:room) { stub_model Room }

  before { sign_in }

  describe '#index.json' do
    before { get :index, format: :json }

    it { should render_template :index }
  end

  describe '#show.json' do
    before { subject.instance_variable_set :@room, room }

    before { expect(subject.current_ability).to receive(:can?).with(:show, room).and_return(true) }

    before { get :show, id: 1, format: :json }

    it { should render_template :show }
  end

  describe '#create.json' do
    let(:params) { { name: 'test_room' } }

    before { expect(Room).to receive(:build).with(subject.current_user, params).and_return(room) }

    before { expect(room).to receive(:save!) }

    before { post :create, room: params, format: :json }

    it { should render_template :create }
  end

  describe '#update.json' do
    let(:params) { { name: 'test_room' } }

    before { expect(Room).to receive(:find).with('1').and_return(room) }

    before { expect(subject.current_ability).to receive(:can?).with(:update, room).and_return(true) }

    before { expect(room).to receive(:update!).with(params) }

    before { put :update, id: 1, room: params, format: :json }

    it { should render_template :update }
  end

  describe '#destroy.json' do
    before { expect(Room).to receive(:find).with('1').and_return(room) }

    before { expect(subject.current_ability).to receive(:can?).with(:destroy, room).and_return(true) }

    before { expect(room).to receive(:destroy!) }

    before { delete :destroy, id: 1, format: :json }

    it { should respond_with :ok }
  end

  describe '#collection' do
    before { expect(subject.current_user).to receive(:rooms).and_return(:rooms) }

    its(:collection) { should eq :rooms }
  end

  describe '#resource' do
    before { subject.instance_variable_set :@room, :room }

    its(:resource) { should eq :room }
  end
end
