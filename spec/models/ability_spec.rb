require 'rails_helper'

describe Ability do
  subject { Ability.new user }

  let(:user) { stub_model User }

  context do
    let(:room) { stub_model Room, users: [user] }

    it { should be_able_to :manage, room }
  end

  context do
    let(:room) { stub_model Room }

    it { should_not be_able_to :manage, room }
  end

  context do
    let(:room) { stub_model Room, users: [user] }

    let(:message) { stub_model Message, room: room }

    it { should be_able_to :manage, message }
  end

  context do
    let(:room) { stub_model Room }

    let(:message) { stub_model Message, room: room }

    it { should_not be_able_to :manage, message }
  end

  context do
    let(:room) { stub_model Room, users: [user] }

    let(:ping) { stub_model Ping, room: room }

    it { should be_able_to :manage, ping }
  end

  context do
    let(:room) { stub_model Room }

    let(:ping) { stub_model Ping, room: room }

    it { should_not be_able_to :manage, ping }
  end

  context do
    let(:room) { stub_model Room, users: [user] }

    let(:picture) { stub_model Picture, room: room }

    it { should be_able_to :manage, picture }
  end

  context do
    let(:room) { stub_model Room }

    let(:picture) { stub_model Picture, room: room }

    it { should_not be_able_to :manage, picture }
  end
end
