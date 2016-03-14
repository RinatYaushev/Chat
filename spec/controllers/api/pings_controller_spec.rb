require 'rails_helper'

RSpec.describe Api::PingsController, type: :controller do
  it { should route(:get, '/api/rooms/1/pings').to(action: :index, room_id: 1) }

  it { should route(:post, '/api/rooms/1/pings').to(action: :create, room_id: 1) }

  before { sign_in }

  describe '#collection' do
    before do
      #
      # subject.parent.pings -> :pings
      #
      expect(subject).to receive(:parent) do
        double.tap { |a| expect(a).to receive(:pings).and_return(:pings) }
      end
    end

    its(:collection) { should eq :pings }
  end
end
