require 'rails_helper'

RSpec.describe Api::UsersController, type: :controller do
  it { should route(:get, '/api/users').to(action: :index) }

  it { should route(:post, '/api/users').to(action: :create) }

  it { should route(:get, '/api/users/1').to(action: :show, id: 1) }

  it { should route(:get, '/api/rooms/1/users').to(action: :index, room_id: 1) }

  describe '#create.json' do
    let(:params) do
      {
        email: 'test@example.com',
        name: 'Test name',
        password: '12345678',
        password_confirmation: '12345678',
        phone: '+380971234567',
        gender: 'female'
      }
    end

    let(:user) { double }

    before { expect(User).to receive(:new).with(params).and_return(user) }

    before { expect(user).to receive(:save!) }

    before { post :create, user: params, format: :json }

    it { should render_template :create }
  end

  before { sign_in }

  describe '#index.json' do
    context do
      before { get :index, room_id: 34, format: :json }

      it { should render_template :index }
    end

    context do
      before { get :index, format: :json }

      it { should render_template :index }
    end
  end

  describe '#show.json' do
    before { get :show, id: 1, format: :json }

    it { should render_template :show }
  end

  describe '#parent' do
    let(:room) { stub_model Room }

    before { expect(subject).to receive(:params).and_return(room_id: 38) }

    before { expect(Room).to receive(:find).with(38).and_return(:room) }

    its(:parent) { should eq :room }
  end

  describe '#collection' do
    before { expect(subject).to receive(:params).and_return(:params) }

    before do
      #
      # subject.users.search_by(params) -> :users
      #
      expect(subject).to receive(:users) do
        double.tap { |a| expect(a).to receive(:search_by).with(:params).and_return(:users) }
      end
    end

    its(:collection) { should eq :users }
  end

  describe '#resource' do
    before { expect(subject).to receive(:params).and_return(id: 1) }

    before { expect(User).to receive(:find).with(1).and_return(:user) }

    its(:resource) { should eq :user }
  end

  describe '#users' do
    context do
      before { expect(subject).to receive(:params).and_return(room_id: 19) }

      before do
        #
        # subject.parent.users -> :users
        #
        expect(subject).to receive(:parent) do
          double.tap { |a| expect(a).to receive(:users).and_return(:users) }
        end

        its(:users) { should eq :users }
      end
    end

    context do
      before { expect(User).to receive(:order).with(:id).and_return(:users) }

      its(:users) { should eq :users }
    end
  end
end
