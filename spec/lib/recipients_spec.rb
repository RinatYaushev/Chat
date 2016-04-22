require 'rails_helper'

RSpec.describe Recipients, type: :lib do
  let(:post) { double room_id: 57, user_id: 25 }

  subject { Recipients.new post }

  describe '#emails' do
    let(:user) { double }

    let(:other_user) { double }

    let(:first) { double }

    before { expect(User).to receive(:joins).with(:rooms).and_return(first) }

    let(:second) { double }

    before do
      #
      # first.where.not(users: { id: 25 }) -> second
      #
      expect(first).to receive(:where) do
        double.tap { |a| expect(a).to receive(:not).with(users: { id: 25 }).and_return(second) }
      end
    end

    before { expect(second).to receive(:where).with(rooms: { id: 57 }).and_return([user, other_user]) }

    its(:users) { should eq [user, other_user] }
  end
end
