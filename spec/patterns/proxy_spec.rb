require 'rails_helper'

RSpec.describe Proxy::User do
  its(:keywords) { should eq [] }
end

RSpec.describe Proxy::ComputerProxy do
  describe '#check_access' do
    context do
      let(:user) { Proxy::User.new [:some_keyword] }

      subject { Proxy::ComputerProxy.new user }

      it { expect { subject.check_access }.to_not raise_error }
    end

    context do
      let(:user) { Proxy::User.new }

      subject { Proxy::ComputerProxy.new user  }

      it { expect { subject.check_access }.to raise_error("You have no access") }
    end
  end

  describe '#real_object' do
    let(:user) { Proxy::User.new }

    subject { Proxy::ComputerProxy.new user }

    before { expect(Proxy::Computer).to receive(:new).and_return(subject) }

    its(:real_object) { should eq subject }
  end

  describe '#execute' do
    let(:user) { Proxy::User.new [:some_keyword] }

    subject { Proxy::ComputerProxy.new user }

    before { expect(subject).to receive(:check_access) }

    before do
      #
      # subject.real_object.execute
      #
      expect(subject).to receive(:real_object) do
        double.tap { |a| expect(a).to receive(:execute) }
      end

      it { expect { subject.execute }.to_not raise_error }
    end
  end
end

RSpec.describe Proxy::Computer do
  describe '#execute' do
    before { expect(subject).to receive(:puts).with("executing commands") }

    it { expect { subject.execute }.to_not raise_error }
  end
end
