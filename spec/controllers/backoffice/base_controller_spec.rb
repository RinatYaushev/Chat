require 'rails_helper'

RSpec.describe Backoffice::BaseController, type: :controller do
  describe '#current_user' do
    before { session[:backoffice_user_id] = 9 }

    before { expect(Backoffice::User).to receive(:find_by).with(id: 9) }

    it { expect { subject.send :current_user }.to_not raise_error }
  end
end
