require 'rails_helper'

RSpec.describe Api::OrdersController, type: :controller do
  it { should route(:get, '/api/orders').to(action: :index) }

  it { should route(:post, '/api/orders').to(action: :create) }

  it { should route(:delete, '/api/orders/1').to(action: :destroy, id: 1) }

  it { should route(:get, '/api/orders/1').to(action: :show, id: 1) }

  let(:order) { stub_model Order }

  let(:user) { stub_model User }

  before { sign_in user }

  describe '#index.json' do
    before { get :index, format: :json }

    it { should render_template :index }
  end

  describe '#show.json' do
    before { subject.instance_variable_set :@order, order }

    before { expect(subject.current_ability).to receive(:can?).with(:show, order).and_return(true) }

    before { get :show, id: 55, format: :json }

    it { should render_template :show }
  end

  describe '#create.json' do
    before { expect(subject.current_ability).to receive(:can?).with(:create, Order).and_return(true) }

    before do
      #
      # user.purchases.cart -> :purchases
      #
      expect(user).to receive(:purchases) do
        double.tap { |a| expect(a).to receive(:cart).and_return(:purchases) }
      end
    end

    before do
      expect(user).to receive(:orders) do
        double.tap { |a| expect(a).to receive(:build).with(purchases: :purchases).and_return(order) }
      end
    end

    before { expect(order).to receive(:save!) }

    before { post :create, format: :json }

    it { should render_template :create }
  end

  describe '#destroy.json' do
    before { expect(subject.current_ability).to receive(:can?).with(:destroy, Order).and_return(true) }

    before { expect(Order).to receive(:find).with('8').and_return(order) }

    before { expect(order).to receive(:destroy!) }

    before { delete :destroy, id: 8, format: :json }

    it { should respond_with :ok }
  end

  describe '#collection' do
    before { expect(subject.current_user).to receive(:orders).and_return(:orders) }

    its(:collection) { should eq :orders }
  end

  describe '#resource' do
    before { subject.instance_variable_set :@order, :order }

    its(:resource) { should eq :order }
  end
end
