require 'rails_helper'

RSpec.describe Backoffice::UsersController, type: :controller do
  it { should be_a Backoffice::BaseController }

  it { should route(:get, '/backoffice/users').to(action: :index) }

  it { should route(:get, '/backoffice/users/1').to(action: :show, id: 1) }

  it { should route(:get, '/backoffice/users/1/edit').to(action: :edit, id: 1) }

  it { should route(:put, '/backoffice/users/1').to(action: :update, id: 1) }

  before { sign_in }

  describe '#index' do
    before { get :index }

    it { should render_template :index }
  end

  describe '#show' do
    before { get :show, id: 1 }

    it { should render_template :show }
  end

  describe '#edit' do
    before { get :edit, id: 1 }

    it { should render_template :edit }
  end

  describe '#update' do
    let(:user) { stub_model Backoffice::User }

    let(:resource_params) { { name: 'test', password: 'password', password_confirmation: 'password' } }

    before { expect(Backoffice::User).to receive(:find).with('9').and_return(user) }

    context do
      before { expect(user).to receive(:update).with(resource_params).and_return(true) }

      before { put :update, id: 9, backoffice_user: resource_params }

      it { should redirect_to user }
    end

    context do
      before { expect(user).to receive(:update).with(resource_params).and_return(false) }

      before { put :update, id: 9, backoffice_user: resource_params }

      it { should render_template :edit }
    end
  end

  describe '#resource' do
    before { expect(subject).to receive(:params).and_return({ id: 26 }) }

    before { expect(Backoffice::User).to receive(:find).with(26).and_return(:user) }

    it { expect { subject.send :resource }.to_not raise_error }
  end

  describe '#collection' do
    before do
      #
      # Backoffice::User.all.active -> :users
      #
      expect(Backoffice::User).to receive(:all) do
        double.tap { |a| expect(a).to receive(:active).and_return(:users) }
      end
    end

    its(:collection) { should eq :users }
  end
end
