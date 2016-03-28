require 'rails_helper'

RSpec.describe Room, type: :model do
  it { should validate_presence_of :name }

  it { should have_many(:users).through(:memberships) }

  it { should have_many(:memberships).dependent(:destroy) }

  it { should have_many(:messages).dependent(:destroy) }

  it { should have_many(:pings).dependent(:destroy) }

  it { should have_many(:men).class_name('User').through(:memberships).source(:user) }

  it { should have_many(:women).class_name('User').through(:memberships).source(:user) }

  context do
    let(:room) { stub_model Room }

    before { expect(room).to receive(:memberships).and_return([:memberships]).twice }

    subject { room.errors.messages }

    before { room.valid? }

    its([:memberships]) { should eq ['Cannot be 1 user'] }
  end

  describe '.build' do
    let(:user) { stub_model User, id: 3 }

    before { expect(Room).to receive(:new).with(name: 'test', user_ids: [1, 2, 3]) }

    it { expect { Room.build user, name: 'test', user_ids: [1, 2] }.to_not raise_error }
  end
end
