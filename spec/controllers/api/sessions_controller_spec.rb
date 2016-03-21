require 'rails_helper'

RSpec.describe Api::SessionsController, type: :controller do
  it { should route(:post, '/api/session').to(action: :create) }

  it { should route(:delete, '/api/session').to(action: :destroy) }

  describe '#create.json' do
    let(:session) { double }

    before { expect(Session).to receive(:new).with(email: 'test@example.com', password: 'test').and_return(session) }

    before { expect(session).to receive(:save!) }

    before { post :create, session: { email: 'test@example.com', password: 'test' }, format: :json }

    it { should render_template :create }
  end

  context do
    before { sign_in }

    describe '#destroy.json' do
      let(:session) { double }

      before { expect(Session).to receive(:new).with(user: subject.current_user).and_return(session) }

      before { expect(session).to receive(:destroy!) }

      before { delete :destroy, format: :json }

      it { should respond_with :ok }
    end
  end
end
