require 'rails_helper'

RSpec.describe Api::CommentsController, type: :controller do
  it { should route(:get, '/api/products/1/comments').to(action: :index, product_id: 1) }

  it { should route(:post, '/api/products/1/comments').to(action: :create, product_id: 1) }

  before { sign_in }

  describe '#create.json' do
    let(:comment) { stub_model Comment }

    let(:params) { { content: 'test_content', user: subject.current_user } }

    before do
      #
      # subject.collection.new -> comment
      #
      expect(subject).to receive(:collection) do
        double.tap { |a| expect(a).to receive(:new).with(params).and_return(comment) }
      end
    end

    before { expect(comment).to receive(:save!) }

    before { post :create, product_id: 8, comment: params, format: :json }

    it { should render_template :create }
  end

  describe '#index.json' do
    before { get :index, product_id: 9, format: :json }

    it { should render_template :index }
  end

  describe '#parent' do
    before { expect(subject).to receive(:params).and_return(product_id: 16) }

    before { expect(Product).to receive(:find).with(16).and_return(:product) }

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
    before { expect(subject).to receive(:params).and_return({ id: 43 }) }

    before { expect(Comment).to receive(:find).with(43) }

    it { expect { subject.send :resource }.to_not raise_error }
  end
end
