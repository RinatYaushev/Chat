require 'rails_helper'

RSpec.describe Api::ProductsController, type: :controller do
  it { should route(:get, '/api/products').to(action: :index) }

  it { should route(:post, '/api/products').to(action: :create) }

  it { should route(:put, '/api/products/1').to(action: :update, id: 1) }

  it { should route(:delete, '/api/products/1').to(action: :destroy, id: 1) }

  it { should route(:get, '/api/products/1').to(action: :show, id: 1) }

  let(:product) { stub_model Product }

  before { sign_in }

  describe '#index.json' do
    before { get :index, format: :json }

    it { should render_template :index }
  end

  describe '#show.json' do
    before { get :show, id: 45, format: :json }

    it { should render_template :show }
  end

  describe '#create.json' do
    let(:params) { { name: 'test_product', price: 100 } }

    before { expect(Product).to receive(:new).with(params).and_return(product) }

    before { expect(product).to receive(:save!) }

    before { post :create, product: params, format: :json }

    it { should render_template :create }
  end

  describe '#update.json' do
    let(:params) { { name: 'test_product', price: 100 } }

    before { expect(Product).to receive(:find).with('51').and_return(product) }

    before { expect(product).to receive(:update!).with(params) }

    before { put :update, id: 51, product: params, format: :json }

    it { should render_template :update }
  end

  describe '#destroy.json' do
    before { expect(Product).to receive(:find).with('54').and_return(product) }

    before { expect(product).to receive(:destroy!) }

    before { delete :destroy, id: 54, format: :json }

    it { should respond_with :ok }
  end

  describe '#collection' do
    before { expect(Product).to receive(:all) }

    it { expect { subject.send :collection }.to_not raise_error }
  end

  describe '#resource' do
    before { expect(subject).to receive(:params).and_return({ id: 55 }) }

    before { expect(Product).to receive(:find).with(55) }

    it { expect { subject.send :resource }.to_not raise_error }
  end
end
