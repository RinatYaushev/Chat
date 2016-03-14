require 'rails_helper'

describe Ability do
  subject { Ability.new user }

  let(:user) { stub_model User }

  let(:room) { stub_model Room, users: [user] }

  let(:message) { stub_model Message, room: room }

  let(:ping) { stub_model Ping, room: room }

  it { should be_able_to :manage, room }

  it { should be_able_to :manage, message }

  it { should be_able_to :manage, ping }

  it { should_not be_able_to :manage, stub_model(Room) }
end
