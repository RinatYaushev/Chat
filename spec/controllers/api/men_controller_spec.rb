require 'rails_helper'

RSpec.describe Api::MenController, type: :controller do
  it { should route(:get, '/api/rooms/1/men').to(action: :index, room_id: 1) }

  let(:room) { stub_model Room }

  before { sign_in }

  describe '#index.json' do
    before { get :index, room_id: 2, format: :json }

    it { should render_template :index }
  end

  describe '#parent' do
    before { expect(subject).to receive(:params).and_return(room_id: 46) }

    before { expect(Room).to receive(:find).with(46).and_return(:room) }

    its(:parent) { should eq :room }
  end

  describe '#collection' do
    before do
      #
      # subject.parent.men -> :men
      #
      expect(subject).to receive(:parent) do
        double.tap { |a| expect(a).to receive(:men).and_return(:men) }
      end
    end

    its(:collection) { should eq :men }
  end
end
