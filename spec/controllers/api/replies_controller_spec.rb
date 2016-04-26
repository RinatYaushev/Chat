require 'rails_helper'

RSpec.describe Api::RepliesController, type: :controller do
  it { should route(:get, '/api/comments/1/replies').to(action: :index, comment_id: 1) }

  it { should route(:post, '/api/comments/1/replies').to(action: :create, comment_id: 1) }

  before { sign_in }

  describe '#create.json' do
    let(:comment) { stub_model Comment }

    let(:params) { { content: 'test_content', user: subject.current_user } }

    before { expect(subject.current_ability).to receive(:can?).with(:create, :reply).and_return(true) }

    before do
      #
      # subject.collection.new -> comment
      #
      expect(subject).to receive(:collection) do
        double.tap { |a| expect(a).to receive(:new).with(params).and_return(comment) }
      end
    end

    before { expect(comment).to receive(:save!) }

    before { post :create, comment_id: 27, reply: params, format: :json }

    it { should render_template :create }
  end

  describe '#index.json' do
    before { expect(subject.current_ability).to receive(:can?).with(:index, :reply).and_return(true) }

    before { get :index, comment_id: 9, format: :json }

    it { should render_template :index }
  end

  describe '#parent' do
    before { expect(subject).to receive(:params).and_return(comment_id: 1) }

    before { expect(Comment).to receive(:find).with(1).and_return(:comment) }

    its(:parent) { should eq :comment }
  end

  describe '#collection' do
    before do
      #
      # subject.parent.replies -> :replies
      #
      expect(subject).to receive(:parent) do
        double.tap { |a| expect(a).to receive(:replies).and_return(:replies) }
      end
    end

    its(:collection) { should eq :replies }
  end

  describe '#resource' do
    before { expect(subject).to receive(:params).and_return({ id: 2 }) }

    before { expect(Comment).to receive(:find).with(2) }

    it { expect { subject.send :resource }.to_not raise_error }
  end
end
