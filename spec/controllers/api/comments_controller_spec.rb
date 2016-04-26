require 'rails_helper'

RSpec.describe Api::CommentsController, type: :controller do
  it { should route(:get, '/api/products/1/comments').to(action: :index, product_id: 1) }

  it { should route(:post, '/api/products/1/comments').to(action: :create, product_id: 1) }

  before { sign_in }

  describe '#create.json' do
    let(:product) { stub_model Product }

    let(:comment) { double }

    let(:params) { { content: 'test_content', user: subject.current_user } }

    before { expect(Product).to receive(:find).with('54').and_return(product) }

    before { expect(subject.current_ability).to receive(:can?).with(:show, product).and_return(true) }

    before { expect(subject.current_ability).to receive(:can?).with(:create, product => Comment).and_return(true) }

    before do
      #
      # subject.collection.new -> comment
      #
      expect(subject).to receive(:collection) do
        double.tap { |a| expect(a).to receive(:new).with(params).and_return(comment) }
      end
    end

    before { expect(comment).to receive(:save!) }

    before { post :create, product_id: 54, comment: params, format: :json }

    it { should render_template :create }
  end

  describe '#index.json' do
    let(:product) { stub_model Product }

    let(:comment) { double }

    before { expect(Product).to receive(:find).with('58').and_return(product) }

    before { expect(subject.current_ability).to receive(:can?).with(:show, product).and_return(true) }

    before { expect(subject.current_ability).to receive(:can?).with(:index, product => Comment).and_return(true) }

    before { get :index, product_id: 58, format: :json }

    it { should render_template :index }
  end

  describe '#parent' do
    before { subject.instance_variable_set :@product, :product }

    its(:parent) { should eq :product }
  end

  describe '#collection' do
    before do
      #
      # subject.parent.comments -> :comments
      #
      expect(subject).to receive(:parent) do
        double.tap { |a| expect(a).to receive(:comments).and_return(:comments) }
      end
    end

    its(:collection) { should eq :comments }
  end

  describe '#resource' do
    before { subject.instance_variable_set :@comment, :comment }

    its(:resource) { should eq :comment }
  end
end
