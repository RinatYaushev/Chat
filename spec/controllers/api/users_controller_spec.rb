require 'rails_helper'

RSpec.describe Api::UsersController, type: :controller do
  it { should route(:post, '/api/users').to(action: :create) }

  it { should route(:get, '/api/users/1').to(action: :show, id: 1) }

  context do
    let(:user) { stub_model User }

    before { sign_in user }

    describe '#create.json' do
      let(:params) do
        {
          name: 'Test name',
          password: '12345678',
          password_confirmation: '12345678'
        }
      end

      before { expect(User).to receive(:new).with(params).and_return(user) }

      before { expect(user).to receive(:save!) }

      before { post :create, user: params, format: :json }

      it { should render_template :create }
    end

    describe '#show.json' do
      before { get :show, id: 1, format: :json }

      it { should render_template :show }
    end
  end

  describe '#resource' do
    before { expect(subject).to receive(:params).and_return({ id: 1 }) }

    before { expect(User).to receive(:find).with(1) }

    it { expect { subject.send :resource }.to_not(raise_error) }
  end
end
