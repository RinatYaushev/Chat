require 'rails_helper'

describe Ability, type: :model do
  subject { Ability.new user }

  context :user do
    let(:user) { stub_model User, roles: [:user] }

    context do
      let(:room) { stub_model Room, users: [user] }

      it { should be_able_to :create, room }
    end

    context do
      let(:room) { stub_model Room }

      it { should_not be_able_to :create, room }
    end

    context do
      let(:room) { stub_model Room, users: [user] }

      it { should be_able_to :read, room }
    end

    context do
      let(:room) { stub_model Room }

      it { should_not be_able_to :read, room }
    end

    context do
      let(:room) { stub_model Room, users: [user] }

      let(:message) { stub_model Message, room: room }

      it { should be_able_to :create, message }
    end

    context do
      let(:room) { stub_model Room }

      let(:message) { stub_model Message, room: room }

      it { should_not be_able_to :create, message }
    end

    context do
      let(:room) { stub_model Room, users: [user] }

      let(:message) { stub_model Message, room: room }

      it { should be_able_to :read, message }
    end

    context do
      let(:room) { stub_model Room }

      let(:message) { stub_model Message, room: room }

      it { should_not be_able_to :read, message }
    end

    context do
      let(:room) { stub_model Room, users: [user] }

      let(:ping) { stub_model Ping, room: room }

      it { should be_able_to :create, ping }
    end

    context do
      let(:room) { stub_model Room }

      let(:ping) { stub_model Ping, room: room }

      it { should_not be_able_to :create, ping }
    end

    context do
      let(:room) { stub_model Room, users: [user] }

      let(:ping) { stub_model Ping, room: room }

      it { should be_able_to :read, ping }
    end

    context do
      let(:room) { stub_model Room }

      let(:ping) { stub_model Ping, room: room }

      it { should_not be_able_to :read, ping }
    end

    context do
      let(:room) { stub_model Room, users: [user] }

      let(:picture) { stub_model Picture, room: room }

      it { should be_able_to :create, picture }
    end

    context do
      let(:room) { stub_model Room }

      let(:picture) { stub_model Picture, room: room }

      it { should_not be_able_to :create, picture }
    end

    context do
      let(:room) { stub_model Room, users: [user] }

      let(:picture) { stub_model Picture, room: room }

      it { should be_able_to :read, picture }
    end

    context do
      let(:room) { stub_model Room }

      let(:picture) { stub_model Picture, room: room }

      it { should_not be_able_to :read, picture }
    end

    context do
      let(:product) { stub_model Product }

      it { should be_able_to :read, product }
    end

    context do
      let(:purchase) { stub_model Purchase, user: user }

      it { should be_able_to :manage, purchase }
    end

    context do
      let(:purchase) { stub_model Purchase }

      it { should_not be_able_to :manage, purchase }
    end

    context do
      let(:order) { stub_model Order, user: user }

      it { should be_able_to :manage, order }
    end

    context do
      let(:order) { stub_model Order }

      it { should_not be_able_to :manage, order }
    end

    context do
      let(:comment) { stub_model Comment, user: user }

      it { should be_able_to :create, comment }
    end

    context do
      let(:comment) { stub_model Comment }

      it { should_not be_able_to :create, comment }
    end

    context do
      let(:comment) { stub_model Comment, user: user }

      it { should be_able_to :read, comment }
    end

    context do
      let(:comment) { stub_model Comment }

      it { should_not be_able_to :read, comment }
    end
  end

  context :moderator do
    let(:user) { stub_model User, roles: [:moderator] }

    context do
      let(:room) { stub_model Room }

      it { should be_able_to :update, room }
    end

    context do
      let(:product) { stub_model Product }

      it { should be_able_to :update, product }
    end
  end

  context :administrator do
    let(:user) { stub_model User, roles: [:administrator] }

    context do
      let(:room) { stub_model Room }

      it { should be_able_to :destroy, room }
    end

    context do
      let(:product) { stub_model Product }

      it { should be_able_to :create, product }
    end

    context do
      let(:product) { stub_model Product }

      it { should be_able_to :destroy, product }
    end
  end
end
