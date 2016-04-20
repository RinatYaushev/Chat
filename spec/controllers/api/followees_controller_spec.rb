require 'rails_helper'

RSpec.describe Api::FolloweesController, type: :controller do
  it { should route(:get, '/api/followees').to(action: :show) }

  before { sign_in }

  describe '#show.json' do
    before { get :show, format: :json }

    it { should render_template :show }
  end
end
