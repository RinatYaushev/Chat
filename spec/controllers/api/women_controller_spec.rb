require 'rails_helper'

RSpec.describe Api::WomenController, type: :controller do
  it { should route(:get, '/api/rooms/1/women').to(action: :index, room_id: 1) }

  let(:room) { stub_model Room }

  before { sign_in }

  describe '#index.json' do
    before { get :index, room_id: 4, format: :json }

    it { should render_template :index }
  end

  describe '#parent' do
    before { expect(subject).to receive(:params).and_return(room_id: 8) }

    before { expect(Room).to receive(:find).with(8).and_return(:room) }

    its(:parent) { should eq :room }
  end

  describe '#collection' do
    before do
      #
      # subject.parent.users.female -> :women
      #
      expect(subject).to receive(:parent) do
        double.tap do |a|
          expect(a).to receive(:users) do
            double.tap { |b| expect(b).to receive(:female).and_return(:women) }
          end
        end
      end
    end

    its(:collection) { should eq :women }
  end
end
