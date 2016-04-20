require 'rails_helper'

RSpec.describe Api::RelationshipsController, type: :controller do
  it { should route(:post, '/api/relationships').to(action: :create) }

  it { should route(:delete, '/api/relationships/1').to(action: :destroy, id: 1) }

  let(:relationship) { stub_model Relationship }

  before { sign_in }

  describe '#create.json' do
    let(:params) { { followee_id: 45, follower_id: subject.current_user.id } }

    before { expect(Relationship).to receive(:new).with(params).and_return(relationship) }

    before { expect(relationship).to receive(:save!) }

    before { post :create, relationship: params, format: :json }

    it { should render_template :create }
  end

  describe '#destroy.json' do
    before { expect(Relationship).to receive(:find).with('50').and_return(relationship) }

    before { expect(relationship).to receive(:destroy!) }

    before { delete :destroy, id: 50, format: :json }

    it { should respond_with :ok }
  end

  describe '#resource' do
    before { expect(subject).to receive(:params).and_return(id: 48) }

    before { expect(Relationship).to receive(:find).with(48).and_return(:relationship) }

    its(:resource) { should eq :relationship }
  end
end
