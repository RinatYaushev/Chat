require 'rails_helper'

RSpec.describe Api::PurchasesController, type: :controller do
  it { should route(:get, '/api/purchases').to(action: :index) }

  it { should route(:get, '/api/purchases/1').to(action: :show, id: 1) }

  it { should route(:post, '/api/purchases').to(action: :create) }

  it { should route(:put, '/api/purchases/1').to(action: :update, id: 1) }

  it { should route(:delete, '/api/purchases/1').to(action: :destroy, id: 1) }

  let(:purchase) { stub_model Purchase }

  before { sign_in }

  describe '#index.json' do
    before { expect(subject.current_ability).to receive(:can?).with(:index, Purchase).and_return(true) }

    before { get :index, format: :json }

    it { should render_template :index }
  end

  describe '#show.json' do
    before { subject.instance_variable_set :@purchase, purchase }

    before { expect(subject.current_ability).to receive(:can?).with(:show, purchase).and_return(true) }

    before { get :show, id: 47, format: :json }

    it { should render_template :show }
  end

  describe '#create.json' do
    let(:params) { { user: subject.current_user, product_id: 50, quantity: 5 } }

    before { expect(subject.current_ability).to receive(:can?).with(:create, Purchase).and_return(true) }

    before { expect(Purchase).to receive(:new).with(params).and_return(purchase) }

    before { expect(purchase).to receive(:save!) }

    before { post :create, purchase: params, format: :json }

    it { should render_template :create }
  end

  describe '#update.json' do
    let(:params) { { user: subject.current_user, product_id: 12, quantity: 10 } }

    before { expect(subject.current_ability).to receive(:can?).with(:update, Purchase).and_return(true) }

    before { expect(Purchase).to receive(:find).with('19').and_return(purchase) }

    before { expect(purchase).to receive(:update!) }

    before { put :update, id: 19, purchase: params, format: :json }

    it { should render_template :update }
  end

  describe '#destroy.json' do
    before { expect(subject.current_ability).to receive(:can?).with(:destroy, Purchase).and_return(true) }

    before { expect(Purchase).to receive(:find).with('10').and_return(purchase) }

    before { expect(purchase).to receive(:destroy!) }

    before { delete :destroy, id: 10, format: :json }

    it { should respond_with :ok }
  end

  describe '#collection' do
    before { expect(subject.current_user).to receive(:purchases).and_return(:purchases) }

    its(:collection) { should eq :purchases }
  end

  describe '#resource' do
    before { subject.instance_variable_set :@purchase, :purchase }

    its(:resource) { should eq :purchase }
  end
end
