require 'rails_helper'

describe UserDecorator, type: :decorator do
  describe '#as_json' do
    let(:user) do
      stub_model User,
        id: 1,
        email: 'test@example.com',
        name: 'Test',
        gender: 'man',
        messages_count: 25,
        pings_count: 12,
        pictures_count: 38,
        purchases_count: 5,
        orders_count: 9,
        phone: '+380971234567',
        followers_count: 17,
        followees_count: 44,
        roles: [:administrator, :moderator, :user]
    end

    subject { user.decorate }

    before { expect(subject).to receive(:active_relationships).and_return(:active_relationships) }

    before { expect(subject).to receive(:passive_relationships).and_return(:passive_relationships) }

    before do
      #
      # user.avatar.url(:orginal) -> 'http://test.host/original.jpeg'
      #
      expect(user).to receive(:avatar) do
        double.tap { |a| expect(a).to receive(:url).with(:original).and_return('http://test.host/original.jpeg') }
      end
    end

    its('as_json.symbolize_keys') do
      should eq \
      id: 1,
      email: 'test@example.com',
      name: 'Test',
      gender: 'man',
      messages_count: 25,
      pings_count: 12,
      pictures_count: 38,
      purchases_count: 5,
      orders_count: 9,
      phone: '+380971234567',
      active_relationships: :active_relationships,
      passive_relationships: :passive_relationships,
      avatar: 'http://test.host/original.jpeg',
      followers_count: 17,
      followees_count: 44,
      roles: [:administrator, :moderator, :user]
    end
  end
end
