require 'rails_helper'

RSpec.describe Api::UsersController, type: :controller do
  it { should route(:post, '/api/users').to(action: :create) }

  it { should route(:get, '/api/users/1').to(action: :show, id: 1) }

  describe '#create.json' do
    let(:params) do
      {
        name: 'Test name',
        password: '12345678',
        password_confirmation: '12345678'
      }
    end

    let(:user) { double }

    before { expect(User).to receive(:new).with(params).and_return(user) }

    before { expect(user).to receive(:save!) }

    before { post :create, user: params, format: :json }

    it { should render_template :create }
  end

  context do
    before { sign_in }

    describe '#show.json' do
      before { get :show, id: 1, format: :json }

      it { should render_template :show }
    end
  end

  describe '#resource' do
    before { expect(subject).to receive(:params).and_return(id: 1) }

    before { expect(User).to receive(:find).with(1).and_return(:user) }

    its(:resource) { should eq :user }
  end
end
