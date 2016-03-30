require 'rails_helper'

RSpec.describe Backoffice::BaseController, type: :controller do
  describe '#current_user' do
    before { session[:backoffice_user_id] = 9 }

    before do
      #
      # Backoffice::User.active.find_by(9)
      #
      expect(Backoffice::User).to receive(:active) do
        double.tap { |a| expect(a).to receive(:find_by).with(id: 9) }
      end
    end

    it { expect { subject.send :current_user }.to_not raise_error }
  end
end
