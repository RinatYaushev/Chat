require 'rails_helper'

RSpec.describe Command::Instruction do
  let(:commands) { [] }

  its(:commands) { should eq [] }

  describe '#run_command' do
    let(:command) { double }

    before { expect(command).to receive(:execute) }

    before { subject.run_command command }

    its(:commands) { should eq [command] }
  end

  describe '#undo_command' do
    let(:commands) { [Command::Instruction.new] }

    its(:commands) { should eq [] }
  end
end

RSpec.describe Command::Amount do
  its(:dollar) { should eq 500 }

  its(:euro) { should eq 300 }
end

RSpec.describe Command::DollarCommand do
  describe '#execute' do
    let(:amount) { Command::Amount.new }

    subject { Command::DollarCommand.new(amount) }

    before { expect(amount).to receive(:dollar).and_return(1000) }

    its(:execute) { should eq 1100 }
  end

  describe '#unexecute' do
    let(:amount) { Command::Amount.new }

    subject { Command::DollarCommand.new(amount) }

    before { expect(amount).to receive(:dollar).and_return(1000) }

    its(:unexecute) { should eq 900 }
  end
end

RSpec.describe Command::EuroCommand do
  describe '#execute' do
    let(:amount) { Command::Amount.new }

    subject { Command::EuroCommand.new(amount) }

    before { expect(amount).to receive(:euro).and_return(500) }

    its(:execute) { should eq 700 }
  end

  describe '#unexecute' do
    let(:amount) { Command::Amount.new }

    subject { Command::EuroCommand.new(amount) }

    before { expect(amount).to receive(:euro).and_return(500) }

    its(:unexecute) { should eq 300 }
  end
end
