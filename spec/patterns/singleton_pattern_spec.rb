require 'rails_helper'

RSpec.describe SingletonPattern::User do
  describe '.instance' do
    before { expect(SingletonPattern::User).to receive(:send).with(:new).and_return(:user) }

    it { expect(SingletonPattern::User.instance).to eq :user }
  end
end
