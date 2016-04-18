require 'rails_helper'

RSpec.describe ObserverPattern::User do
  it { should be_a Observable }

  let(:user) { ObserverPattern::User.new 'Bob', 'Bobenko', 10000 }

  subject { user }

  describe '.new' do
    its(:firstname) { should eq 'Bob' }

    its(:lastname) { should eq 'Bobenko' }

    its(:salary) { should eq 10000 }
  end

  describe '#firstname=' do
    before { expect(subject).to receive(:changed) }

    before { expect(subject).to receive(:notify_observers).with(subject) }

    before { user.firstname = 'Vova' }

    its(:firstname) { should eq 'Vova' }
  end

  describe '#lastname=' do
    before { expect(subject).to receive(:changed) }

    before { expect(subject).to receive(:notify_observers).with(subject) }

    before { user.lastname = 'Vovenko' }

    its(:lastname) { should eq 'Vovenko' }
  end

  describe '#salary=' do
    before { expect(subject).to receive(:changed) }

    before { expect(subject).to receive(:notify_observers).with(subject) }

    before { user.salary = 250000 }

    its(:salary) { should eq 250000 }
  end
end

RSpec.describe ObserverPattern::Notifier do
  describe '#update' do
    let(:user) { ObserverPattern::User.new('Vova', 'Vovenko', 10000) }

    before { expect(subject).to receive(:puts).with("Now your firstname is Vova") }

    before { expect(subject).to receive(:puts).with("Now your lastname is Vovenko") }

    before { expect(subject).to receive(:puts).with("Your salary is 10000") }

    it { expect { subject.update(user) }.to_not raise_error }
  end
end
