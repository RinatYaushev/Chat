require 'rails_helper'

RSpec.describe Backoffice::SessionsController, type: :controller do
  it { should be_a Backoffice::BaseController }

  it { should route(:get, '/backoffice/session/new').to(action: :new) }

  it { should route(:post, '/backoffice/session').to(action: :create) }

  it { should route(:delete, '/backoffice/session').to(action: :destroy) }

  describe '#new' do
    before { get :new }

    it { should render_template :new }

    it { should render_with_layout 'backoffice/sessions' }
  end

  describe '#create' do
    let(:user) { stub_model Backoffice::User, id: 31 }

    let(:resource) { double user: user }

    let(:resource_params) { { username: 'test', password: 'password' } }

    before { expect(Backoffice::Session).to receive(:new).with(resource_params).and_return(resource) }

    context do
      before { expect(resource).to receive(:save).and_return(user) }

      before { post :create, backoffice_session: resource_params }

      it { should redirect_to :backoffice }

      it { expect(session[:backoffice_user_id]).to eq 31 }
    end

    context do
      before { expect(resource).to receive(:save).and_return(nil) }

      before { post :create, backoffice_session: { username: 'test', password: 'password' } }

      it { should render_template :new }
    end
  end

  describe '#destroy' do
    before { sign_in }

    before { session[:backoffice_user_id] = 42 }

    before { delete :destroy }

    it { should redirect_to [:new, :backoffice, :session] }

    it { expect(session[:backoffice_user_id]).to be_nil }
  end
end
