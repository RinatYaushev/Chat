require 'rails_helper'

describe UserDecorator do
  describe '#as_json' do
    let(:user) { stub_model User, id: 1, name: 'Test', messages_count: 0, pings_count: 0 }

    subject { user.decorate.as_json }

    its([:id]) { should eq 1 }

    its([:name]) { should eq 'Test' }

    its([:messages_count]) { should eq 0 }

    its([:pings_count]) { should eq 0 }

    context do
      before { expect(user).to receive(:avatar).with(:medium).and_return('/medium.jpeg') }

      before { expect(user).to receive(:avatar).with(:thumbnail).and_return('/thumbnail.jpeg') }

      its([:avatar]) do
        should eq medium: 'http://test.host/medium.jpeg', thumbnail: 'http://test.host/thumbnail.jpeg'
      end
    end
  end
end
