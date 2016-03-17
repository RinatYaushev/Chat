require 'rails_helper'

RSpec.describe Api::AvatarsController, type: :controller do
  it { should route(:put, '/api/profile/avatar').to(action: :update) }

  before { sign_in }

  describe '#update.json' do
    let(:params) { { avatar: 'avatar' } }

    before { expect(subject.current_user).to receive(:update!).with(params) }

    before { put :update, user: params, format: :json }

    it { should render_template :update }
  end
end
